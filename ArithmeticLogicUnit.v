`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:41 01/21/2019 
// Design Name: 
// Module Name:    ArithmeticLogicUnit 
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
module ArithmeticLogicUnit( input [31:0] SrcA,
									 input [31:0] SrcB,
									 input [2:0] ALUControl,
									 output ZeroFlag,
									 output [31:0] ALUResult );
	reg [31:0] result;
	always @(*) begin
		if (ALUControl == 2) // ALUControl = 010
			result = SrcA + SrcB; 
	end
	
	assign ALUResult = result;

endmodule
