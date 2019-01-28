`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:30 01/27/2019 
// Design Name: 
// Module Name:    Fetch_Decode_Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This pipeline register separates the Fetch and Decode stages 
// of the pipeline. It sits brtween the Instruction Memory and Register File.
//////////////////////////////////////////////////////////////////////////////////
module Fetch_Decode_Pipeline( input clk,
										input [31:0] IM_RD,
										input [31:0] PC_Plus_One_F,
										output reg [31:0] Instruction,
										output reg [31:0] PC_Plus_One_D
										);
										
	always @(posedge clk) begin
		Instruction <= IM_RD;
		PC_Plus_One_D <= PC_Plus_One_F;
	end 
	
endmodule
