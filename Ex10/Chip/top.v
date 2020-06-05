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

module project(
	input clk_p,
	input clk_n,
	//Define inputs
	input lights,
	input plugs,
	input temperature,
	input rst,
	output reg lights_old,
	output reg lights_data,
	output reg plugs_old,
	output reg plugs_data,
	output reg temperature_old,
	output reg temperature_data
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

	//Define wires and registers
	always @(posedge clk) begin
		if(rst==1)
			lights_data<=0;
		else if(lights!=lights_old)	
			lights_data<=1;
		else
			lights_data<=0;
		lights_old<=lights;
		if(rst==1)
			plugs_data<=0;
		else if(plugs!=plugs_old)	
			plugs_data<=1;
		else
			plugs_data<=0;
		plugs_old<=plugs;
		if(rst==1)
			temperature_data<=0;
		else if(temperature!=temperature_old)	
			temperature_data<=1;
		else
			temperature_data<=0;
		temperature_old<=temperature;
	end

endmodule
