`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:13 01/21/2019 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile( input clk, 
							input RegWrite, 
							input [4:0] A1, 
							input [4:0] A2,
							input [4:0] A3, 
							input [31:0] WD3, 
							output [31:0] RD1, 
							output [31:0] RD2 );
	
	reg [31:0] file [31:0];
	
	// Writes into the register file happen if RegWrite enable = 1. 
	// Updates after posedge of clk.
	always @(posedge clk) begin
		if (RegWrite) begin
			file[A3] <= WD3;
		end
	end
	
	// Assign the base address to RD1. 
	assign RD1 = file[A1];
	
endmodule
