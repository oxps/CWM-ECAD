//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Payas Sinha
// Date: 06/02/2020
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
		err=0;
		rst=1;
		button=0;
		sel=1;
		#30
		rst=0;
		button=1;
		sel=0;
		#30
		button=0;
		sel=0;
		#30
		if(out!=3'd4)
       		begin //Test for dice and button
          		$display("***TEST FAILED! DICE DOESN'T WORK! out==4, actual out=%d ***",out);
          		err=1;
       		end
		sel=1;
		#20
		if(out!=3'd1)
      		begin //Test for alternating between dice and button
          		$display("***TEST FAILED! CHECK ALTERNATION FROM DICE TO TRAFFIC! out==1, actual out=%d ***",out);
          		err=1;
       		end
		#10
		rst=1;
	end
		
	          
	//Finish simulation and check for success
	initial begin
	#150
	if (err==0)
		$display("***TEST PASSED!***");
	$finish;
	end

	//Instantiate module
	Ex6 top (
	.clk(clk),
	.sel (sel),
	.rst (rst),
	.button (button),
	.out (out)
	);
     
endmodule 
