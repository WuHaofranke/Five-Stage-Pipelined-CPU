`timescale 1ns / 1ps



module regfile(
input wire rst,
 input wire clk,
 input wire[`RegAddrBus]waddr,
 input wire[`RegDataBus]wdata,
 input wire we,
 input wire[`RegAddrBus]raddr1,
 input wire re1,
 output reg[`RegDataBus]rdata1,
 input wire[`RegAddrBus]raddr2,
 input wire re2,
 output reg [`RegDataBus]rdata2
 );
 reg[`RegDataBus] regs[`RegNum]; 
 initial begin
 
regs[1]=32'h12341234;
 regs[2]=32'h43214321;
 regs[3]=32'h12341234;
 regs[4]=32'h43214321;
 regs[5]=32'h12341234;
 regs[6]=32'h43214321;
 regs[7]=32'h12341234;
 regs[8]=32'h12341234;
 regs[9]=32'h12341234;
 regs[10]=32'h12341234;
 regs[11]=32'h12341234;
 regs[12]=32'h12341234;
 regs[13]=32'h12341234;
 regs[14]=32'h12341234;
 regs[15]=32'h12341234;
 regs[16]=32'h43214321;
 regs[17]=32'h43214321;
 regs[18]=32'h43214321;
 regs[19]=32'h43214321;
 regs[20]=32'h43214321;
 regs[21]=32'h43214321;
 regs[22]=32'h43214321;
 regs[23]=32'h43214321;
 regs[24]=32'h43214321;
 regs[25]=32'h43214321;
 regs[26]=32'h43214321;
 regs[27]=32'h43214321;
 regs[28]=32'h43214321;
 regs[29]=32'h43214321;
 regs[30]=32'h43214321;
 regs[31]=32'h43214321;
 
 
 end
 always@(posedge clk)begin
 if(rst==`RstDisable)begin
 if((we==`WriteEnable)&&(waddr!=0))begin
 regs[waddr]<=wdata;
 end
 end
 end
 always@(*)begin
 if(rst==`RstEnable)begin
 rdata1<=`ZeroWord;
 end else if((re1==`ReadEnable)&&(raddr1==0))begin
 rdata1<=32'h0;
 end else if(re1==`ReadEnable)begin
 rdata1<=regs[raddr1];
 end else begin
 rdata1<=32'h0;
 end
 end
 always@(*)begin 
 if(rst==`RstEnable)begin
rdata2<=32'h0;
 end else if((re2==`ReadEnable)&&(raddr2==0))begin
 rdata2<=32'h0;
 end  
if((re2==`ReadEnable)&&(raddr2==waddr)&&(we==1))begin 
 rdata2<=wdata; 
 end else if(re2==`ReadEnable)begin
 rdata2<=regs[raddr2];
 end else begin
 rdata2<=32'h0;
 end
 end
 
 
endmodule

