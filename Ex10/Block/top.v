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
	//Define inputs
	input clk,
	input lights,
	input plugs,
	input temperature,
	input rst,
	output reg lights_old,
	output reg plugs_old,
	output reg temperature_old,
	output reg [5:0] data
	);

	//Define wires and registers
	wire [1:0] lights_update;
	wire [1:0] plugs_update;
	wire [1:0] temperature_update;
	
	//Logic
	//Easily scalable by instantiating check_state module
	check_state lights_checker(.clk(clk),.rst(rst),.old(lights_old),.new(lights),.to_be_assigned(lights_update));
	check_state plugs_checker(.clk(clk),.rst(rst),.old(plugs_old),.new(plugs),.to_be_assigned(plugs_update));
	check_state temperature_checker(.clk(clk),.rst(rst),.old(temperature_old),.new(temperature),.to_be_assigned(temperature_update));


	always @(posedge clk) begin
		data[1:0]<=lights_update;
		lights_old<=lights;

		data[3:2]<=plugs_update;
		plugs_old<=plugs;

		data[5:4]<=temperature_update;
		temperature_old<=temperature;
	end

endmodule
