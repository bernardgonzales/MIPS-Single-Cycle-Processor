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
module TopLevel (input master_clk // Connect all clocks together.
//					  input [2:0] ALUControl, // ALU Control on what operation ALU performs
//					  input RegWrite, // Control on Register Write 
//					  input MemWrite, // Control on Data Memory Write
//					  input RegDstControl, // Control on what register to write to in Register File
//					  input ALUSrcControl, // Control on what to choose SrcB for ALU comes from 
//					  input MemtoRegControl // Control on what data to write into the Register File. 
					  );
					  
	wire [31:0] PCout_Addr_Plus1; 
	wire [31:0] PC_Plus1_Result;
	wire [31:0] Instruction; 
	wire [31:0] RD1_SrcA;
	wire [31:0] SignExtend;
	wire [31:0] ALUResult;
	wire [31:0] DMReadData;
	wire [31:0] RFRD2;
	wire [4:0] Multi_WriteReg; 
	wire [31:0] Multi_SrcB;
	wire [31:0] Multi_WriteData; 
	wire [31:0] PC_Branch_Result;
	wire [31:0] Multi_PC;
	wire Connect_Zero_Flag; 
	
	// Main Decoder wires
	wire Connect_MemtoReg;
	wire Connect_MemWrite;
	wire Connect_Branch; 
	wire Connect_ALUSrc;
	wire Connect_RegDst;
	wire Connect_RegWrite;
	
	// ALU Decoder wire
	wire [2:0] Connect_ALUControl; 
	wire [1:0] Connect_ALUOp;
	
	// Jump 
	wire [27:0] Shifted_Jump;
	wire [31:0] Multiplexer_4_PC;
	wire [31:0] Jump_PC;
	wire [31:0] Multiplexer_5_PC;
	wire Connect_Jump;
	
	Shift_Left_2 U16 ( .oldPC(Instruction[25:0]), .newPC(Shifted_Jump) );
	
	Multiplexer_5 U15 ( .Multiplexer_Instruction(Multiplexer_4_PC), .Jump_Instruction( {PC_Plus1_Result[31:28], Shifted_Jump} ), .Jump_Control(Connect_Jump), .New_PC(Multiplexer_5_PC) );
	
	Main_Decoder U14 ( .Opcode(Instruction[31:26]), .MemtoReg(Connect_MemtoReg), .MemWrite(Connect_MemWrite), .Branch(Connect_Branch), .ALUSrc(Connect_ALUSrc), .RegDst(Connect_RegDst), .RegWrite(Connect_RegWrite), .ALUOp(Connect_ALUOp), .Jump(Connect_Jump) );
	
	ALU_Decoder U13 ( .ALUOp(Connect_ALUOp), .Funct(Instruction[5:0]), .ALUControl(Connect_ALUControl) );
	
	ProgramCounter U00 ( .PCin(Multiplexer_5_PC), .clk(master_clk), .PCout(PCout_Addr_Plus1) );
	
	PCPlus1 U01 ( .PCin(PCout_Addr_Plus1), .PCout(PC_Plus1_Result) );
	
	Multiplexer_4 U11 ( .a(PC_Plus1_Result), .b(PC_Branch_Result), .PC_Next(Multiplexer_4_PC), .AND_Result(AND_Result) );
	
	InstructionMemory U02 ( .A(PCout_Addr_Plus1), .RD(Instruction) );
	
	RegisterFile U03 ( .clk(master_clk), .RegWrite(Connect_RegWrite), .A1(Instruction[25:21]), .A2(Instruction[20:16]), .A3(Multi_WriteReg), .WD3(Multi_WriteData), .RD1(RD1_SrcA), .RD2(RFRD2) );
	
	Multiplexer_1 U07 ( .a(Instruction[20:16]), .b(Instruction[15:11]), .RegDst(Connect_RegDst), .WriteReg(Multi_WriteReg) );
	
	Zero_Flag_Check U12 ( .a(Connect_Zero_Flag), .b(Connect_Branch), .result(AND_Result) );
	
	ArithmeticLogicUnit U05 ( .SrcA(RD1_SrcA), .SrcB(Multi_SrcB), .ALUControl(Connect_ALUControl), .ALUResult(ALUResult), .ZeroFlag(Connect_Zero_Flag) );
	
	Multiplexer_2 U08 ( .a(RFRD2), .b(SignExtend), .ALUSrcSel(Connect_ALUSrc), .Multiplexed_SrcB(Multi_SrcB) );
	
	SignExtend U04 ( .a(Instruction[15:0]), .signImm(SignExtend) );
	
	DataMemory U06 ( .clk(master_clk), .WE(Connect_MemWrite), .A(ALUResult), .WD(RFRD2), .RD(DMReadData) );

	Multiplexer_3 U09 ( .a(ALUResult), .b(DMReadData), .Result(Multi_WriteData), .MemtoRegSel(Connect_MemtoReg) );
	
	PC_Branch U10 ( .a(SignExtend), .b(PC_Plus1_Result), .PC_Branch(PC_Branch_Result) );
endmodule
