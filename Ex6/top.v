//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module Ex6(
	//Define inputs
	input clk,
	input sel,
	input rst,
	input button,
	output [2:0] out
	);

	//Logic	
	diceroll dice(.clk(clk),.rst(rst),.button(button));
	traffic trafficlights(.clk(clk));

	assign out[2:0]=(sel==0)?dice:
		(sel==1)?trafficlights:
		0;  

endmodule

