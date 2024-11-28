`timescale 1ns / 1ps



module mips_sopc1(
input wire rst,
 input wire clk
 );
 wire rom_ce;
 wire[`InstAddrBus] inst_addr;
 wire[`InstBus] inst;
pipline_cpu pipline_cpu0(rst,clk,inst,rom_ce,inst_addr);
 inst_rom inst_rom0(rom_ce,inst_addr,inst);

endmodule
