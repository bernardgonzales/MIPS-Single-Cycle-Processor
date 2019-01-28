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
											 input [31:0] ALUResultM,
											 input [31:0] DMReadDataM,
											 input [4:0] WriteRegM,
											 output reg RegWriteW,
											 output reg MemtoRegW,
											 output reg [31:0] ALUResultW,
											 output reg [31:0] DMReadDataW,
											 output reg [4:0] WriteRegW
											 );
	always @(posedge clk) begin
			RegWriteW <= RegWriteM;
			MemtoRegW <= MemtoRegM;
			ALUResultW <= ALUResultM;
			DMReadDataW <= DMReadDataM;
			WriteRegW <= WriteRegM;
			
	end

endmodule
