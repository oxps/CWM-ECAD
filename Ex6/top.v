//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Payas Sinha
// Date: 02/06/2020
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

	//Define wires
	wire red;
	wire amber;
	wire green;
	wire [2:0] throw;

	//Logic	
	diceroll dice(.clk(clk),.rst(rst),.button(button),.throw(throw));
	traffic trafficlights(.clk(clk),.red(red),.amber (amber),.green (green));

	assign out[2:0]=(sel==0)?throw:
		(sel==1)?{red,amber,green}:
		0;  

endmodule

