//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Payas Sinha
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters
	parameter CLK_PERIOD = 10;

	//Registers and wires
	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;

	wire [2:0] out;

	//Clock generation
	initial
	begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end


	//Testing
	initial begin
		rst=0;
		button=1;
		sel=1;
		#100
		sel=0;
		#100
		button=0;
		#100
		rst=1;
	end
		
	          
	//Finish simulation and check for success
	initial begin
	#100
	if (err==0)
		$display("***TEST PASSED!***");
	$finish;
	end

	//User's module
	Ex6 top (
	.clk(clk),
	.sel (sel),
	.rst (rst),
	.button (button),
	.out (out)
	);
     
endmodule 
