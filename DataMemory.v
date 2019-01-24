`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:08 01/21/2019 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory( input clk, 
						 input WE,
						 input [31:0] A,
						 input [31:0] WD,
						 output [31:0] RD );
						 
	reg [31:0] mem [63:0];
	
	initial begin 
		mem[0] = 0;
		mem[1] = 0;
		mem[2] = 0;
		mem[3] = 0;
		mem[4] = 0; 
		mem[5] = 0;
		mem[6] = 0;
		mem[7] = 0;
		mem[8] = 0;
		mem[9] = 0;
		mem[10] = 0;
	end 
	
	assign RD = mem[A];
	
	// Write data into memory address A when the Write Enable is ON.
	always @(posedge clk) begin
		if (WE)
		mem[A] <= WD;
	end 


endmodule
