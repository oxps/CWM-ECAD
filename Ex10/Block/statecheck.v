//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Payas Sinha
// Date: 05/06/2020
//
//  Description: In this exercise, I am receiving 
//  inputs from IOT devices and outputting a signal
//  when a change is detected.
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module check_state(
	//Define inputs
	input clk,
	input rst,
	input old,
	input new,
	output reg [1:0] to_be_assigned
	);

	//Logic
	//device switched on -> 1
	//device switched off -> 2
	//device same state -> 0
	always @(posedge clk) begin
		if(rst==1)
			to_be_assigned[1:0]<=2'b00;
		else if(new>old)	
			to_be_assigned[1:0]<=2'b01;
		else if(new<old)
			to_be_assigned[1:0]<=2'b10;
		else
			to_be_assigned[1:0]<=2'b00;
	end

endmodule
