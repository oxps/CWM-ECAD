//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Payas Sinha
// Date: 02/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters
	parameter CLK_PERIOD = 10;

	//Registers and wires
	reg clk;
	reg err;

	wire red;
	wire amber;
	wire green;
    
	//Clock generation
	initial
	begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	//Stimulus logic, no separate test for invalid state as testing if loop works is sufficient to see if code is consistent with valid states
	initial begin
		err=0;
		#CLK_PERIOD
		if(red!=1'b1&&amber!=1'b0&&green!=1'b0)       
		begin //test for initialisation
          		$display("***TEST FAILED! INITIALISATION INCORRECT! red==1, amber==0, green==0 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
		#CLK_PERIOD
		if(red!=1'b1&&amber!=1'b1&&green!=1'b0)       
		begin //test for R1A0G0 TO R1A1G0
          		$display("***TEST FAILED! ERROR IN TRANSITION R1A0G0 TO R1A1G0! red==1, amber==1, green==0 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
		#CLK_PERIOD
		if(red!=1'b0&&amber!=1'b0&&green!=1'b1)       
		begin //test for R1A1G0 TO R0A0G1
          		$display("***TEST FAILED! ERROR IN TRANSITION R1A1G0 TO R0A0G1! red==0, amber==0, green==1 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
		#CLK_PERIOD
		if(red!=1'b0&&amber!=1'b1&&green!=1'b0)       
		begin //test for R0A0G1 TO R0A1G0
          		$display("***TEST FAILED! ERROR IN TRANSITION R0A0G1 TO R0A1G0! red==0, amber==1, green==0 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
		#CLK_PERIOD
		if(red!=1'b1&&amber!=1'b0&&green!=1'b0)       
		begin //test for R0A1G0 TO R1A0G0
          		$display("***TEST FAILED! ERROR IN TRANSITION R0A1G0 TO R1A0G0! red==1, amber==0, green==0 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
		#CLK_PERIOD
		#CLK_PERIOD
		#CLK_PERIOD
		#CLK_PERIOD
		if(red!=1'b1&&amber!=1'b0&&green!=1'b0)       
		begin //test for looping consistenct
          		$display("***TEST FAILED! ERROR IN TRANSITION R0A1G0 TO R1A0G0! red==1, amber==0, green==0 actual red=%d, amber=%d, green=%d***",red,amber,green);
			err=1;
		end
	end
	          
	//Finish simulation and check for success
	initial begin
	#100
	if (err==0)
		$display("***TEST PASSED!***");
	$finish;
	end

	//User's module
	traffic top (
	.clk(clk),
	.red (red),
	.amber (amber),
	.green (green)
	);
     
endmodule 
