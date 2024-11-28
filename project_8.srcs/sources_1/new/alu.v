`timescale 1ns / 1ps
`include "defines.v"

module alu(
   input wire[13:0] alu_control,
   input wire[31:0] alu_src1,
   input wire[31:0] alu_src2,
   input wire[4:0] wd_i,
   input wire wreg_i,
   output reg[31:0] alu_result,
   output wire[4:0] wd_o,
   output wire wreg_o
);
    assign wd_o=wd_i;
    assign wreg_o = wreg_i;
    wire[`RegDataBus] alu_src2_mux;
    wire[`RegDataBus] result_sum;
    wire[`RegDataBus] result_slt;
    assign
    alu_src2_mux=((alu_control==`AluopSub)||(alu_control==`AluopSubu)||(alu_control==`AluopSlt))?(~alu_src2+1):alu_src2; //把减法运算转化成加法，补码
    //条件运算符 ? : 在这里使用。如果条件 (alu_control == AluopSub) || (alu_control == AluopSubu) || (alu_control == AluopSlt)成立，则执行二进制补码求反并将 1 加到alu_src2；否则，将 alu_src2赋给alu_src2_mux`。
    assign result_sum=alu_src1+alu_src2_mux;
    assign result_slt=(alu_src1[31]&&!alu_src2[31])||
                      (!alu_src1[31]&&!alu_src2[31]&&result_sum[31])||
                      (alu_src1[31]&&alu_src2[31]&&result_sum[31]);
    always @(*) begin
     case(alu_control)
      `AluopAdd,`AluopAddu,`AluopSub,`AluopSubu:begin
       alu_result=result_sum;
     end
     `AluopSlt:
      alu_result = result_slt;
     `AluopSltu:
     alu_result=(alu_src1<alu_src2);
     `AluopAnd:
      alu_result=alu_src1&alu_src2;
      `AluopOr:
       alu_result=alu_src1|alu_src2;
       `AluopXor:
       alu_result=alu_src1^alu_src2;
       `AluopSll:
       alu_result=alu_src2<<alu_src1[4:0];
       `AluopSrl:
       alu_result=alu_src2>>alu_src1[4:0];
       `AluopSra:
       alu_result=({32{alu_src2[31]}}<<(6'd32-{1'b0,alu_src1[4:0]}))
       |(alu_src2>>alu_src1[4:0]);

       `AluopLui:
       alu_result=alu_src2;
       default:
       alu_result = `ZeroWord;
     endcase
    end
endmodule