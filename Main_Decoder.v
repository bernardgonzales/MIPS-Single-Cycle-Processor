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
							output [1:0] ALUOp,
							output Jump
							);
							
	reg [8:0] control_output; 
	//reg [2:0] alu_operation;
	always @(*) begin 
		case (Opcode) 
		6'b100011: control_output <= 9'b101001000;  // LW
		6'b101011: control_output <= 9'b001010000; // SW
		6'b000100: control_output <= 9'b000100010; // Beq 
		6'b000000: control_output <= 9'b110000100; // R-type 
		6'b001000: control_output <= 9'b101000000; // addi  
		6'b000010: control_output <= 9'b000000001; // Jump 
		endcase
	end 
	
	// Assign Opcode to the respective multiplexers and write enables. 
	assign { RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp[1:0], Jump } = control_output [8:0] ;

endmodule
