`timescale 1ns / 1ps



module inst_fetch(
 input wire rst,
 input wire clk,
 output wire [`InstBus]inst_o
    );
    wire [`InstAddrBus]pc;
    wire ce;
    pc pc0(rst,clk,pc,ce);
    inst_rom inst_rom0(ce,pc,inst_o);
endmodule
