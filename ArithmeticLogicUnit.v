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
									 output  [31:0] ALUResult );
	reg [31:0] result;
	reg flag;
	always @(*) begin
		case (ALUControl)
		0: result <= SrcA & SrcB; // 000 AND
		1: result <= SrcA | SrcB; // 001 OR
		2: result <= SrcA + SrcB; // 010 Addition 
		3: result <= SrcA - SrcB; // 011 Subtraction 
		endcase 
		
		if (result == 0) flag = 1;
	end
	
	
	
	assign ALUResult = result; 
	assign ZeroFlag = flag; 
	
endmodule
