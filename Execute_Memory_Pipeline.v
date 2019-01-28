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
										  output reg RegWriteM,
										  output reg MemtoRegM,
										  output reg MemWriteM
										  );
	always @(posedge clk) begin 
		RegWriteM <= RegWriteE;
		MemtoRegM <= MemtoRegE;
		MemWriteM <= MemWriteE;
	end 

endmodule
