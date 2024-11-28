`timescale 1ns / 1ps
`include"devices.v"

module inst_rom(
 input wire ce,
 input wire[`InstAddrBus]addr,
 output reg [`InstBus]inst
 );
 reg [`InstBus] inst_mem[0:127];
 initial begin 
     $readmemh("C:/Users/wuhao/Desktop/jsjzcyl/rom.data",inst_mem);
 end
 always@(*)begin
     if(ce==0)begin
         inst<=`ZeroWord;
     end else begin
         inst<=inst_mem[addr[31:2]];
         end
      end
endmodule