//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Payas Sinha
// Date: 03/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module multiplier(
	//Define inputs
	input clk,
	input [2:0] a,
	input [2:0] b,
	input read,
	output [5:0] result
	);

	//Define registers
	wire [5:0] address;

	//Logic
	assign address[5:0]=(a*8)+b;


	memory_multiplier memory_multiplier_project(
		.clka(clk),    // input wire clka
		.ena(read),      // input wire ena
		.addra(address),  // input wire [5 : 0] addra
		.douta(result)  // output wire [5 : 0] douta
	);

endmodule
