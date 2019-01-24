`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:34 01/20/2019 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter( input [31:0] PCin,
							  input clk,
							  output reg [31:0] PCout);
	initial begin 
		PCout <= 0;
	end 
	
	always @(posedge clk) begin
		PCout <= PCin;
	end
	
endmodule
