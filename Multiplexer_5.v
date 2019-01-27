`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:32 01/26/2019 
// Design Name: 
// Module Name:    Multiplexer_5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This multiplexer is used to support jump instructions.
//								IF 0: Chooses the next instruction.
//								IF 1: Changes the PC according to the Jump Instruction
//////////////////////////////////////////////////////////////////////////////////
module Multiplexer_5( input [31:0] Multiplexer_Instruction, 
							 input [31:0] Jump_Instruction,
							 input Jump_Control,
							 output [31:0] New_PC
							 );
reg [31:0] temp;

	always @(*) begin
		case (Jump_Control) 
			0: temp <= Multiplexer_Instruction;
			1: temp <= Jump_Instruction;
		endcase 
	end
	
	assign New_PC = temp;
endmodule
