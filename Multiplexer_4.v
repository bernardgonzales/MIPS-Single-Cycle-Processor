`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:31 01/24/2019 
// Design Name: 
// Module Name:    Multiplexer_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This multiplexer was made to support beq instructions. 
//								IF the result of the AND gate (resulting a zero flag from ALU) 
// 							is 1, the next PC instruction will be the result calculated in PCBranch. 
//								Meaning the processor will branch a number of instructions. (Can be + or -).
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer_4( input [31:0] a,
							 input [31:0] b,
							 input AND_Result,
							 output [31:0] PC_Next
							 );
reg [31:0] temp; 

	always @(*) begin 
		case (AND_Result)
			0: temp <= a;
			1: temp <= b;
		endcase 
	end
	
	assign PC_Next = temp;


endmodule
