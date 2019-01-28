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
module TopLevel ( input master_clk // Connect all clocks together.
					 );
					  
	wire [31:0] PCout_Addr_Plus1; 
	wire [31:0] Instruction_Decode; 
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
	
	// Pipeline 1
	wire [31:0] Instruction_Memory_RD; 
	wire [31:0] PC_Plus1_Result_F;
	wire [31:0] Connect_PC_Plus_One_D;
	
	// Pipeline 2
	wire Connect_RegWriteD;
	wire Connect_MemtoRegD;
	wire Connect_MemWriteD;
	wire Connect_BranchD;
	wire [2:0] Connect_ALUControlD;
	wire Connect_ALUSrcD;
	wire Connect_RegDstD;
	wire [31:0] Connect_RD1D;
	wire [31:0] Connect_RD2D;
	//wire [4:0] Connect_RtD;
	//wire [4:0] Connect_RdD;
	wire [31:0] Connect_PCPlusOneD;
	wire [31:0] Connect_SignImmD;
	
	// Pipeline 3
	wire Connect_RegWriteE;
	wire Connect_MemtoRegE;
	wire Connect_MemWriteE;
	wire Connect_BranchE;
	wire Connect_ALUSrcE;
	wire Connect_RegDstE;
	wire [2:0] Connect_ALUControlE;
	wire [31:0] Connect_SrcAE;
	wire [31:0] Connect_RD2DE;
	
	wire [4:0] Connect_RtE;
	wire [4:0] Connect_RdE;
	wire [31:0] Connect_SignImmE;
	wire [31:0] Connect_PCPlusOneE;
	
	// Pipeline 3
	wire Connect_RegWriteM;
	wire Connect_MemtoRegM;
	wire Connect_MemWriteM;
	wire Connect_ZeroFlagE;
	wire [31:0] Connect_ALUResultE;
	wire [4:0] Connect_WriteRegE;
	wire [31:0] Connect_PCBranchE;
	wire [31:0] Connect_PCBranchM;
	wire Connect_BranchM;
	wire [31:0] Connect_ALUResultM;
	wire Connect_ZeroFlagM;
	wire Connect_ZeroFlagResultM;
	wire [31:0] Connect_WriteDataM;
	wire [31:0] Connect_DMReadDataM;
	wire [4:0] Connect_WriteRegM;
	wire Connect_RegWriteW;
	wire Connect_MemtoRegW;
	wire [31:0] Connect_ALUResultW;
	wire [31:0] Connect_DMReadDataW;
	wire [31:0] Connect_WriteDataW;
	wire [4:0] Connect_WriteRegW;
	
	Fetch_Decode_Pipeline U17
	( .clk(master_clk), .IM_RD(Instruction_Memory_RD), .PC_Plus_One_F(PC_Plus1_Result_F), 
			// Inputs ^^^   			Outputs vvv
	.Instruction(Instruction_Decode), .PC_Plus_One_D(Connect_PC_Plus_One_D) );
		
	Decode_Execute_Pipeline U18 
	( 	.clk(master_clk), .RegWriteD(Connect_RegWriteD), .MemtoRegD(Connect_MemtoRegD), .MemWriteD(Connect_MemWriteD), .BranchD(Connect_BranchD), 
	  .ALUControlD(Connect_ALUControlD),.ALUSrcD(Connect_ALUSrcD), .RegDstD(Connect_RegDstD), .RD1_D(Connect_RD1D), .RD2_D(Connect_RD2D), 
	  .Rt_D(Instruction_Decode[20:16]), .Rd_D(Instruction_Decode[15:11]), .SignImm_D(Connect_SignImmD), .PCPlusOne_D(Connect_PCPlusOneD),
		// Inputs ^^^   			Outputs vvv
	  .RegWriteE(Connect_RegWriteE), .MemtoRegE(Connect_MemtoRegE), .MemWriteE(Connect_MemWriteE), .BranchE(Connect_BranchE), .ALUControlE(Connect_ALUControlE),
	  .ALUSrcE(Connect_ALUSrcE), .RegDstE(Connect_RegDstE), .SrcA_E(Connect_SrcAE), .RD2_E(Connect_RD2DE), .Rt_E(Connect_RtE), .Rd_E(Connect_RdE), 
	  .SignImm_E(Connect_SignImmE), .PCPlusOne_E(Connect_PCPlusOneE)
	  
	);
	
	
	Execute_Memory_Pipeline U19 
	(.clk(master_clk), .RegWriteE(Connect_RegWriteE), .MemtoRegE(Connect_MemtoRegE), .MemWriteE(Connect_MemWriteE), .BranchE(Connect_BranchE),
	 .ALUResultE(Connect_ALUResultE), .ZeroFlagE(Connect_ZeroFlagE), .WriteDataE(Connect_RD2DE), .WriteRegE(Connect_WriteRegE), .PCBranch_ResultE(Connect_PCBranchE),										
											// Inputs ^^^   			Outputs vvv										
	 .RegWriteM(Connect_RegWriteM), .MemtoRegM(Connect_MemtoRegM), .MemWriteM(Connect_MemWriteM), .BranchM(Connect_BranchM),
	 .ALUResultM(Connect_ALUResultM), .ZeroFlagM(Connect_ZeroFlagM), .WriteDataM(Connect_WriteDataM), .WriteRegM(Connect_WriteRegM), .PCBranch_ResultM(Connect_PCBranchM)
										  );
	 
	Memory_WriteBack_Pipeline U20 
	( .clk(master_clk), .RegWriteM(Connect_RegWriteM), .MemtoRegM(Connect_MemtoRegM), .ALUResultM(Connect_ALUResultM), .DMReadDataM(Connect_DMReadDataM), 
	.WriteRegM(Connect_WriteRegM),
											// Inputs ^^^   			Outputs vvv											
	.RegWriteW(Connect_RegWriteW), .MemtoRegW(Connect_MemtoRegW), .ALUResultW(Connect_ALUResultW), .DMReadDataW(Connect_DMReadDataW), .WriteRegW(Connect_WriteRegW) );
	
	// Shift_Left_2 U16 ( .oldPC(Instruction_Decode[25:0]), .newPC(Shifted_Jump) );
	
	/*
	Multiplexer_5 U15 ( .Multiplexer_Instruction(Multiplexer_4_PC), .Jump_Instruction( {Instruction_Decode[31:28], Shifted_Jump} ), .Jump_Control(Connect_Jump), 
	.New_PC(Multiplexer_5_PC) );
	*/
	
	Main_Decoder U14 ( .Opcode(Instruction_Decode[31:26]), .MemtoReg(Connect_MemtoRegD), .MemWrite(Connect_MemWriteD), .Branch(Connect_BranchD), 
	.ALUSrc(Connect_ALUSrcD), .RegDst(Connect_RegDstD), .RegWrite(Connect_RegWriteD), .ALUOp(Connect_ALUOp)/*, .Jump(Connect_Jump)*/ );
	
	ALU_Decoder U13 ( .ALUOp(Connect_ALUOp), .Funct(Instruction_Decode[5:0]), .ALUControl(Connect_ALUControlD) );
	
	ProgramCounter U00 ( .PCin(Multiplexer_4_PC), .clk(master_clk), .PCout(PCout_Addr_Plus1) );
	
	PCPlus1 U01 ( .PCin(PCout_Addr_Plus1), .PCout(PC_Plus1_Result_F) );
	
	Multiplexer_4 U11 ( .a(PC_Plus1_Result_F), .b(Connect_PCBranchM), .PC_Next(Multiplexer_4_PC), .AND_Result(Connect_ZeroFlagResultM) );
	
	InstructionMemory U02 ( .A(PCout_Addr_Plus1), .RD(Instruction_Memory_RD) );
	
	RegisterFile U03 ( .clk(master_clk), .RegWrite(Connect_RegWriteW), .A1(Instruction_Decode[25:21]), .A2(Instruction_Decode[20:16]), .A3(Connect_WriteRegW), 
	.WD3(Connect_WriteDataW), .RD1(Connect_RD1D), .RD2(Connect_RD2D) );
	
	Multiplexer_1 U07 ( .a(Connect_RtE), .b(Connect_RdE), .RegDst(Connect_RegDstE), .WriteReg(Connect_WriteRegE) );
	
	Zero_Flag_Check U12 ( .a(Connect_ZeroFlagM), .b(Connect_BranchM), .result(Connect_ZeroFlagResultM) );
	
	ArithmeticLogicUnit U05 ( .SrcA(Connect_SrcAE), .SrcB(Multi_SrcB), .ALUControl(Connect_ALUControlE), .ALUResult(Connect_ALUResultE), .ZeroFlag(Connect_ZeroFlagE) );
	
	Multiplexer_2 U08 ( .a(Connect_RD2DE), .b(Connect_SignImmE), .ALUSrcSel(Connect_ALUSrcE), .Multiplexed_SrcB(Multi_SrcB) );
	
	SignExtend U04 ( .a(Instruction_Decode[15:0]), .signImm(Connect_SignImmD) );
	
	DataMemory U06 ( .clk(master_clk), .WE(Connect_MemWriteM), .A(Connect_ALUResultM), .WD(Connect_WriteDataM), .RD(Connect_DMReadDataM) );

	Multiplexer_3 U09 ( .a(Connect_ALUResultW), .b(Connect_DMReadDataW), .Result(Connect_WriteDataW), .MemtoRegSel(Connect_MemtoRegW) );
	
	PC_Branch U10 ( .a(Connect_SignImmE), .b(Connect_PCPlusOneE), .PC_Branch(Connect_PCBranchE) );
endmodule
