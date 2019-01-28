`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:59 01/27/2019 
// Design Name: 
// Module Name:    Execute_Memory_Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This pipeline register separates the Execute and Memory stages of the pipeline.
// It sits between the ALU and Data Memory stages.
//////////////////////////////////////////////////////////////////////////////////
module Execute_Memory_Pipeline( input clk,
										  input RegWriteE,
										  input MemtoRegE,
										  input MemWriteE,
										  input BranchE,
										  input [31:0] ALUResultE,
										  input ZeroFlagE,
										  input [31:0] WriteDataE,
										  input [4:0] WriteRegE,
										  input [31:0] PCBranch_ResultE,
										  output reg RegWriteM,
										  output reg MemtoRegM,
										  output reg MemWriteM,
										  output reg BranchM,
										  output reg [31:0] ALUResultM,
										  output reg ZeroFlagM,
										  output reg [31:0] WriteDataM,
										  output reg [4:0] WriteRegM,
										  output reg [31:0] PCBranch_ResultM
										  );
	always @(posedge clk) begin 
		RegWriteM <= RegWriteE;
		MemtoRegM <= MemtoRegE;
		MemWriteM <= MemWriteE;
		BranchM <= BranchE;
		ALUResultM <= ALUResultE;
		ZeroFlagM <= ZeroFlagE;
		WriteDataM <= WriteDataE;
		WriteRegM <= WriteRegE;
		PCBranch_ResultM <= PCBranch_ResultE;
	end 

endmodule
