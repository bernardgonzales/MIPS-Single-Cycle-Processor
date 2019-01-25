`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:33 01/24/2019 
// Design Name: 
// Module Name:    Multiplexer_2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This multiplexer chooses which SrcB to give to the ALU. 
//								0: (R-type) RD2 from the Register File. (a)
//								1: (Load word/Store word) SignImm from Sign Extend. (b)
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer_2( input [31:0] a,
							 input [31:0] b,
							 input ALUSrcSel,
							 output [31:0] Multiplexed_SrcB
							 );
	reg [31:0] temp; 
	
	always @(*) begin 
		case (ALUSrcSel)
			0: temp <= a;
			1: temp <= b;
		endcase 
	end 
	
	assign Multiplexed_SrcB = temp; 
endmodule
