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
										  output reg RegWriteE,
										  output reg MemtoRegE,
										  output reg MemWriteE,
										  output reg BranchE,
										  output reg [2:0] ALUControlE,
										  output reg ALUSrcE,
										  output reg RegDstE
										  );
										

	always @(posedge clk) begin 
		RegWriteE <= RegWriteD;
		MemtoRegE <= MemtoRegD;
		MemWriteE <= MemWriteD;
		BranchE <= BranchD;
		ALUControlE <= ALUControlD;
		ALUSrcE <= ALUSrcD;
		RegDstE <= RegDstD;
	end 


endmodule
