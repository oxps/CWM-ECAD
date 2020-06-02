//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Payas Sinha
// Date: 02/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module traffic(
	//Define inputs
	input clk,
	output reg red,
	output reg amber,
	output reg green
	);

	//Define wires
	wire out;

	reg [2:0] state;
	always @* begin
		state = {red, amber, green};
	end

	//Logic	
	always @(posedge clk)
	case(state)
		3'b000:	begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
		3'b101: begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
		3'b111: begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
		3'b011: begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
		3'b100: begin
			red<=1'b1; 
			amber<=1'b1;
			green<=1'b0;
			end
		3'b110: begin
			red<=1'b0; 
			amber<=1'b0;
			green<=1'b1;
			end
		3'b001: begin
			red<=1'b0; 
			amber<=1'b1;
			green<=1'b0;
			end
		3'b010: begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
		default: begin
			red<=1'b1; 
			amber<=1'b0;
			green<=1'b0;
			end
	endcase

endmodule

