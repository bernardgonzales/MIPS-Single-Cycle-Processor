`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:11 01/27/2019 
// Design Name: 
// Module Name:    Memory_WriteBack_Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This pipeline register separates the Memory and Write Back stages
// of the pipeline. It sits after the data memory but before multiplexer 3.
//////////////////////////////////////////////////////////////////////////////////
module Memory_WriteBack_Pipeline( input clk,
											 input RegWriteM,
											 input MemtoRegM,
											 output reg Register_File_WE,
											 output reg Multiplexer_3_Select
											 );
	always @(posedge clk) begin
			Register_File_WE <= RegWriteM;
			Multiplexer_3_Select <= MemtoRegM;
	end

endmodule
