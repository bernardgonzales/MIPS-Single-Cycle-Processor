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
	
	reg [31:0] registers [31:0];
	
	// Initialize file to 0s. 
	initial begin 
	registers[0] = 32'h00000000;
	registers[1] = 32'h00000000;
	registers[2] = 32'h00000000;
	registers[3] = 32'h00000000;
	registers[4] = 32'h00000000;
	registers[5] = 23;
	registers[6] = 32'h00000000;
	registers[7] = 32'h00000000;
	registers[8] = 32'h00000000;
	registers[9] = 32'h00000000;
	registers[10] = 32'h00000000;
	registers[11] = 32'h00000000;
	registers[12] = 32'h00000000;
	registers[13] = 32'h00000000;
	registers[14] = 32'h00000000;
	registers[15] = 32'h00000000;
	registers[16] = 32'h00000000;
	registers[17] = 32'h00000000;
	registers[18] = 32'h00000000;
	registers[19] = 32'h00000000;
	registers[20] = 32'h00000000;
	registers[21] = 32'h00000000;
	registers[22] = 32'h00000000;
	registers[23] = 32'h00000000;
	registers[24] = 32'h00000000;
	registers[25] = 32'h00000000;
	registers[26] = 32'h00000000;
	registers[27] = 32'h00000000;
	registers[28] = 32'h00000000;
	registers[29] = 32'h00000000;
	registers[30] = 32'h00000000;
	registers[31] = 32'h00000000;

	
	end 
	// Writes into the register file happen if RegWrite enable = 1. 
	// Updates after posedge of clk.
	always @(posedge clk) begin
		if (RegWrite) begin
			registers[A3] <= WD3;
		end
	end
	
	// Assign the base address to RD1. 
	assign RD1 = registers[A1];
	
	// Assign value of register at A2 to RD2.
	assign RD2 = registers[A2];
	
	
endmodule
