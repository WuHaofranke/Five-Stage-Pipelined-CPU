`define RegAddrBus 4:0
`define RegDataBus 31:0
`define RstEnable 1
`define RstDisable 0
`define CeEnable 1
`define CeDisable 0
`define WriteEnable 1
`define WriteDisable 0
`define ReadEnable 1
`define ReadDisable 0
`define RegNum 31:0
`define RegWidth 31:0
`define ZeroWord 32'h0
`define ZeroRegAddr 5'd0
`define InstAddrBus 31:0
`define InstBus 31:0
`define Aluop_OnehotBus 13:0
`define ADD_OP  14'b10_0000_0000_0000
`define ADDU_OP 14'b01_0000_0000_0000
`define SUB_OP  14'b00_1000_0000_0000
`define SUBU_OP 14'b00_0100_0000_0000
`define SLT_OP  14'b00_0010_0000_0000
`define SLTU_OP 14'b00_0001_0000_0000
`define AND_OP  14'b00_0000_1000_0000
`define OR_OP   14'b00_0000_0100_0000
`define XOR_OP  14'b00_0000_0010_0000
`define NOR_OP  14'b00_0000_0001_0000
`define SLL_OP  14'b00_0000_0000_1000
`define SRL_OP  14'b00_0000_0000_0100
`define SRA_OP  14'b00_0000_0000_0010
`define LUI_OP  14'b00_0000_0000_0001
`define NOP_OP  14'b00_0000_0000_0000