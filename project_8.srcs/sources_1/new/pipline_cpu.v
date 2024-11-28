`timescale 1ns / 1ps



module pipline_cpu(
    input wire rst,
    input wire clk,
    input wire[31:0] rom_inst_i,
    output wire rom_ce_o,
    output wire[31:0] rom_addr_o
    );
    
    pc pc0( rst,clk, rom_addr_o, rom_ce_o);

    // 输入的是id的东西
    wire[31:0] inst_i;
    wire[31:0]reg1_data_i;
    wire[31:0]reg2_data_i;
    wire[13:0] aluop_o;
    wire[`RegDataBus]reg1_o;
    wire[`RegDataBus]reg2_o;
    wire[`RegAddrBus]wd_o0;
    wire wreg_o0;
    wire[`RegAddrBus]reg1_addr_o;
    wire[`RegAddrBus]reg2_addr_o;
    wire reg1_read_o;
    wire reg2_read_o;
    
     if_id if_id0(clk,rom_inst_i,inst_i);
    id id0(rst,inst_i,reg1_data_i,reg2_data_i,
    aluop_o,reg1_o,reg2_o,wd_o0,wreg_o0,
    reg1_addr_o,reg2_addr_o,reg1_read_o,reg2_read_o);
   
   wire[13:0] alu_control;
   wire[31:0] alu_src1;
   wire[31:0] alu_src2;
   wire[4:0] wd_i;
   wire wreg_i;
   wire [31:0] alu_result;
   wire[4:0] wd_o;
   wire wreg_o;

    id_ex id_ex0(clk,aluop_o,reg1_o,reg2_o,wd_o0,wreg_o0,
    alu_control,alu_src1,alu_src2,wd_i,wreg_i);

    alu alu0(alu_control,alu_src1,alu_src2,wd_i,wreg_i
    ,alu_result,wd_o,wreg_o);
    wire [31:0] wdata_i;
    wire [4:0] wd_i1;
    wire wreg_i1;
    wire[31:0] wdata_o;
    wire[4:0] wd_o1;
    wire wreg_o1;

    ex_mem ex_mem0(clk,alu_result,wd_o,wreg_o,
    wdata_i,wd_i1,wreg_i1);

    mem mem0(wdata_i,wd_i1,wreg_i1,wdata_o,wd_o1,wreg_o1) ;
     // memwb的output
     //reg [31:0] wb_wdata;
     //reg [4:0] wb_wd;
     //reg wb_wreg;
    
    mem_wb mem_wb0(clk,wdata_o,wd_o1,wreg_o1,wb_wdata
    ,wb_wd,wb_wreg);
    
    regfile regfile0(rst,clk,wb_wd,wb_wdata,
    wb_wreg,reg1_addr_o,reg1_read_o,reg1_data_i,reg2_addr_o,
    reg2_read_o,reg2_data_i);
    
   endmodule

