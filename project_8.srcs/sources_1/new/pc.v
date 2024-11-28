`timescale 1ns / 1ps



module pc(
input wire rst,
input wire clk,
output reg [31:0]pc,
output reg ce
);
   always@(posedge clk)begin
       if(rst==1)begin
          ce<=0;
         end else begin
            ce<=1;
         end
      end
      always@(posedge clk)begin
         if(ce==0)begin
            pc<=0;
         end else begin
         pc<=pc+32'd4;   
      end
    end

endmodule
