`timescale 1ns / 1ps




module ex_mem(
    input wire clk,
    input wire[31:0] ex_wdata,
    input wire[4:0] ex_wd,
    input wire ex_wreg,
    output reg[31:0] mem_wdata,
    output reg[4:0] mem_wd,
    output reg mem_wreg
    );
    always @(posedge clk) begin
        mem_wdata <= ex_wdata;
        mem_wd <= ex_wd;
        mem_wreg <= ex_wreg;
    end
endmodule
