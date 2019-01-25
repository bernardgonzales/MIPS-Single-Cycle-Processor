`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:39 01/24/2019 
// Design Name: 
// Module Name:    Multiplexer_3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This multiplexer chooses which data to write into the Register File. 
//								0: (R-type) Chooses ALU Result from ALU. (a)
//								1: (Load Word/Store Word) Read Data from Data Memory. (b) 
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer_3( input [31:0] a,
							 input [31:0] b,
							 input MemtoRegSel,
							 output [31:0] Result
							 );
	reg[31:0] temp;
	
	always @(*) begin 
		case (MemtoRegSel)
			0: temp <= a;
			1: temp <= b;
		endcase 
	end 
	
	assign Result = temp; 

endmodule
