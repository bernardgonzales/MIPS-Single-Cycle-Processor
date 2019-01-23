`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:15 01/21/2019 
// Design Name: 
// Module Name:    PCPlus4 
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
module PCPlus4( input [31:0] PCin,
					 output [31:0] PCout );
					 
	assign PCout = PCin + 4;


endmodule
