//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Payas Sinha
// Date: 05/06/2020
//
// Description: A testbench module to test Ex10
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters
	parameter CLK_PERIOD = 2;

	//Registers and wires
	reg clk;
	reg lights;
	reg plugs;
	reg temperature;
	reg rst;
	reg err;

	wire lights_old;
	wire plugs_old;
	wire temperature_old;

	wire [5:0] data;	
	
	//Clock generation
	initial
	begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end
	
	//Testing
	initial begin
		err=0;
		rst=1;
		lights=0;
		plugs=0;
		temperature=30;
		#10
		rst=0;
		lights=1;
		plugs=1;
		temperature=31;
		#20
		lights=0;
		plugs=0;
		temperature=0;
		#20
		temperature=25;
		#20
		lights=1;
		temperature=23;
		#20
		lights=0;
		plugs=1;
		temperature=28;
	end

	//Finish testbench
	initial begin
	#150
	if(err==0)
		$display("***TEST PASSED!***");
	$finish;
	end
		
	//Instantiate module
	project top(
		.clk(clk),
		.lights(lights),
		.plugs(plugs),
		.temperature(temperature),
		.rst(rst),
		.lights_old(lights_old),
		.plugs_old(plugs_old),
		.temperature_old(temperature_old),
		.data(data)
	);
     
endmodule 
