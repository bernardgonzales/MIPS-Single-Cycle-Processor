`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:33 01/24/2019 
// Design Name: 
// Module Name:    Multiplexer_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This multiplexer chooses which register to write to. 
//								0 = (Load Word) Chooses Instruction [20:16] (a)
//								1 = (R-type) Chooses Instruction [15:11] (b)
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer_1( input [4:0] a,
							 input [4:0] b,
							 input RegDst,
							 output [4:0] WriteReg
							 );
	reg [4:0] temp;
	always @(*) begin 
		case (RegDst)
			0: temp <= a;
			1: temp <= b;
		endcase 
	end 

	assign WriteReg = temp;

endmodule
