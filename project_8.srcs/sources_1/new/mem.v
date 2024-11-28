`timescale 1ns / 1ps



module mem(
    input wire[31:0] wdata_i,
    input wire[4:0] wd_i,
    input wire wreg_i,
    output wire[31:0] wdata_o,
    output wire[4:0] wd_o,
    output wire wreg_o
    );
    assign wreg_o = wreg_i;
    assign wd_o = wd_i;
    assign wdata_o = wdata_i;
    
    
    
    
    
endmodule
