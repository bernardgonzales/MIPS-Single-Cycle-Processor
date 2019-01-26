`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:08 01/25/2019 
// Design Name: 
// Module Name:    ALU_Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: The ALU Decoder takes in funct from Instruction [5:0]. 
//								If the ALUOp is 0 or 1, the instruction is I-type. (Load word/Store word)
//								Otherwise it is an R-type and the decoder will look at the funct field to tell the ALU what operation to perform.
//////////////////////////////////////////////////////////////////////////////////
module ALU_Decoder( input [1:0] ALUOp,
						  input [5:0] Funct,
						  output [2:0] ALUControl
						  );
	reg [2:0] temp; 
	always @(*) begin
		case (ALUOp)			   // I-TYPE
			3'b000: temp <= 3'b010; // Add
			3'b001: temp <= 3'b110; // Sub
			default: case (Funct)		  // R-TYPE
				6'b100000: temp <= 3'b010; // Add 
				6'b100010: temp <= 3'b110; // Sub
				6'b100100: temp <= 3'b000; // And 
				6'b100101: temp <= 3'b001; // Or
				6'b101010: temp <= 3'b111; // Slt
			endcase 
		endcase
	end
	assign ALUControl = temp; 
endmodule
