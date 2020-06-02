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
	diceroll dice_result(.clk(clk),.rst(rst),.button(button));
	traffic traffic_result(.clk(clk));

	assign out[2:0]=(sel==0)?dice_result:
		(sel==1)?traffic_result:
		0;  

endmodule

