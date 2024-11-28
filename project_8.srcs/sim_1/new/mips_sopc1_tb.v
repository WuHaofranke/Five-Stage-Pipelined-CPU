`timescale 1ns / 1ps



module mips_sopc1_tb(

    );
    reg clk;
    reg rst;
    
    mips_sopc1 mips_sopc10(.clk(clk),.rst(rst));
initial begin 
    clk = 1;
    forever begin
        #10 clk = ~clk;
     end
     end
     initial begin 
        rst = 0;
        #30 rst = 1;
        #50 rst = 0;
     end
endmodule
