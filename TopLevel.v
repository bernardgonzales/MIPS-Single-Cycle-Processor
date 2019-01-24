`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:15 01/22/2019 
// Design Name: 
// Module Name:    TopLevel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TopLevel (input master_clk, // Clock Control
					  input [2:0] ALUControl, // ALU Control 
					  input RegWrite // Control on Register Write 
					  
					  );
					  
	wire [31:0] PCout_Addr_Plus1; 
	wire [31:0] Plus1_PCin;
	wire [31:0] Whole_RD; 
	wire [31:0] RD1_SrcA;
	wire [31:0] SignExtend_SrcB;
	wire [31:0] ALUResult_DMAddress;
	wire [31:0] DMReadData_RFWriteData3;
	
	ProgramCounter U00 ( .PCin(Plus1_PCin), .clk(master_clk), .PCout(PCout_Addr_Plus1) );
	
	PCPlus1 U01 ( .PCin(PCout_Addr_Plus1), .PCout(Plus1_PCin) );
	
	InstructionMemory U02 ( .A(PCout_Addr_Plus1), .RD(Whole_RD) );
	
	RegisterFile U03 ( .clk(master_clk), .RegWrite(RegWrite), .A1(Whole_RD[25:21]), .A2(A2), .A3(Whole_RD[20:16]), .WD3(DMReadData_RFWriteData3), .RD1(RD1_SrcA), .RD2(RD2) );
	
	SignExtend U04 ( .a(Whole_RD[15:0]), .signImm(SignExtend_SrcB) );
	
	ArithmeticLogicUnit U05 ( .SrcA(RD1_SrcA), .SrcB(SignExtend_SrcB), .ALUControl(ALUControl), .ALUResult(ALUResult_DMAddress), .ZeroFlag(ZeroFlag) );
	
	DataMemory U06 ( .clk(master_clk), .WE(WE), .A(ALUResult_DMAddress), .WD(WD), .RD(DMReadData_RFWriteData3) );

endmodule
