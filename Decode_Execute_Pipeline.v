`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:43 01/27/2019 
// Design Name: 
// Module Name:    Decode_Execute_Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This pipeline register separates the Decode and Execute stages 
// of the pipeline. It sits between the Register File and the ALU stages. 
//////////////////////////////////////////////////////////////////////////////////
module Decode_Execute_Pipeline( input clk,
										  input RegWriteD,
										  input MemtoRegD,
										  input MemWriteD,
										  input BranchD,
										  input [2:0] ALUControlD,
										  input ALUSrcD,
										  input RegDstD,
										  input [31:0] RD1_D,
										  input [31:0] RD2_D,
										  input [4:0] Rt_D,
										  input [4:0] Rd_D,
										  input [31:0] SignImm_D,
										  input [31:0] PCPlusOne_D,	  
										  
										  output reg RegWriteE,
										  output reg MemtoRegE,
										  output reg MemWriteE,
										  output reg BranchE,
										  output reg [2:0] ALUControlE,
										  output reg ALUSrcE,
										  output reg RegDstE,
										  output reg [31:0] SrcA_E,
										  output reg [31:0] RD2_E,
										  output reg [4:0] Rt_E,
										  output reg [4:0] Rd_E,
										  output reg [31:0] SignImm_E,
										  output reg [31:0] PCPlusOne_E
										  );
										

	always @(posedge clk) begin 
		RegWriteE <= RegWriteD;
		MemtoRegE <= MemtoRegD;
		MemWriteE <= MemWriteD;
		BranchE <= BranchD;
		ALUControlE <= ALUControlD;
		ALUSrcE <= ALUSrcD;
		RegDstE <= RegDstD;
		SrcA_E <= RD1_D;
		RD2_E <= RD2_D;
		Rt_E <= Rt_D;
		Rd_E <= Rd_D;
		SignImm_E <= SignImm_D;
		PCPlusOne_E <= PCPlusOne_D;
		
		
	end 


endmodule
