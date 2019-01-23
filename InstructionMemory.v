`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:46 01/20/2019 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory( input [31:0] A,
								  output [31:0] RD );
	reg [31:0] RAM [64:0]; 

	initial begin 
		$readmemb ("/home/bernard/Documents/Compute Engineering/Study/SingleCycleProcessor/RegFile.dat",RAM);
	end 

	assign RD = RAM[A];

endmodule
