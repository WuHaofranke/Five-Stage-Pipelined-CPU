`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 15:05:47
// Design Name: 
// Module Name: mips_sopc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips_sopc_tb(

    );
reg clk;
 reg rst;
 mips_sopc mips_sopc0(.clk(clk),.rst(rst));
 initial begin
 rst=1;
 #100
 rst=0;
 #1000 $finish;

 end
 initial begin
 clk=1'b0;
 forever #10 clk=~clk;
 end
endmodule
