`timescale 1ns / 1ps



module id_ex(
    input wire clk,
    input wire[13:0] id_aluop,
    input wire[31:0] id_reg1,
    input wire[31:0] id_reg2,
    input wire[4:0] id_wd,
    input wire id_wreg,
    output reg[13:0] ex_aluop,
    output reg[31:0] ex_reg1,
    output reg[31:0] ex_reg2,
    output reg[4:0] ex_wd,
    output reg ex_wreg
    );
    always@(posedge clk)begin
        ex_aluop <= id_aluop;
        ex_reg1 <= id_reg1;
        ex_reg2 <= id_reg2;
        ex_wd <= id_wd;
        ex_wreg <= id_wreg;
    end
endmodule
