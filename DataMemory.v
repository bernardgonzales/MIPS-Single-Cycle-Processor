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
	reg [31:0] data;
	initial begin 
		mem[0] = 10;
		mem[1] = 9;
		mem[2] = 8;
		mem[3] = 7;
		mem[4] = 6; 
		mem[5] = 5;
		mem[6] = 4;
		mem[7] = 3;
		mem[8] = 2;
		mem[9] = 1;
		mem[10] = 0;
	end 
	
	always @(*) begin 
		data <= mem[A];
	end 
	
	assign RD = data;
	
	// Write data into memory address A when the Write Enable is ON.
	always @(posedge clk) begin
		if (WE)
		mem[A] <= WD;
	end 


endmodule
