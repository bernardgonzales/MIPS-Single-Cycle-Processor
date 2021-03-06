`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:16 01/24/2019 
// Design Name: 
// Module Name:    Zero_Flag_Check 
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
module Zero_Flag_Check( input a, 
								input b,
								output result
								);
	reg temp; 
	
	always @(*) begin
		temp <= a & b;
	end
	
	assign result = temp; 

endmodule
