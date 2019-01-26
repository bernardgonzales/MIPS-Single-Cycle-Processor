`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:33 01/25/2019 
// Design Name: 
// Module Name:    Main_Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: The main decoder takes in the Opcode and assigns the respective bits to the 
// enables and select lines of the processor depending on the type of instruction. ss
//////////////////////////////////////////////////////////////////////////////////
module Main_Decoder( input [5:0] Opcode,
							output MemtoReg, 
							output MemWrite,
							output Branch,
							output ALUSrc, 
							output RegDst, 
							output RegWrite,
							output [1:0] ALUOp
							);
							
	reg [7:0] control_output; 
	//reg [2:0] alu_operation;
	always @(*) begin 
		case (Opcode) 
		6'b100011: control_output <= 8'b10100100;  // Load Word
		6'b101011: control_output <= 8'b00101000; // Store Word
		6'b000100: control_output <= 8'b00010001; // Beq 
		6'b000000: control_output <= 8'b11000010; // R-type instruction

		endcase
	end 
	
	// Assign Opcode to the respective multiplexers and write enables. 
	assign { RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp[1:0] } = control_output [7:0] ;
	/*
	assign RegWrite = control_output[7];
	assign RegDst = control_output[6]; 
	assign ALUSrc = control_output[5];
	assign Branch = control_output[4];
	assign MemWrite = control_output[3];
	assign MemtoReg = control_output[2];
	assign ALUOp[2:0] = control_output[1:0];*/
endmodule
