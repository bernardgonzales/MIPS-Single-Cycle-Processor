`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:43 01/24/2019 
// Design Name: 
// Module Name:    PC_Branch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This adder adds SignImm from Sign Extend module (a) with the result from PCPlus4 (b). 
//
//////////////////////////////////////////////////////////////////////////////////
module PC_Branch( input [31:0] a,
						input [31:0] b,
						output [31:0] PC_Branch
						);
reg [31:0] temp;

	always @(*) begin
	temp <= a + b; 
	end 
	
	assign PC_Branch = temp;

endmodule
