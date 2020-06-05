//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name: Payas Sinha
// Date: 05/06/2020
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////


module top(
	input clk_p,
	input clk_n,
	//Todo: add all other ports besides clk_n and clk_p
	input rst_n,
	input button,
	output led_0,
	output led_1,
	output led_2
	);
    

	/* clock infrastructure, do not modify */
	wire clk_ibufds;

	IBUFDS IBUFDS_sysclk (
		.I(clk_p),
		.IB(clk_n),
		.O(clk_ibufds)
	);

	wire clk; //use this signal as a clock for your design
        
	BUFG bufg_clk (
		.I  (clk_ibufds),
		.O  (clk)
	);

	//Add logic here
	reg [32:0] counter;
	reg state0, state1, state2;

	assign led_0=state0;
	assign led_1=state1;
	assign led_2=state2;

	always @(posedge clk)
	if (button==1'b1) begin
		state0<=1'b0;
		state1<=1'b0;
		state2<=1'b0;
		end
	else if (rst_n==1'b0) begin
		state0<=1'b0;
		state1<=1'b0;
		state2<=1'b0;
		end
	else begin
		counter<=counter+1;
		state0<=counter[20];
		state1<=counter[21];
		state2<=counter[22];
	end
	

endmodule
