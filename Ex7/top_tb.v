//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Payas Sinha
// Date: 03/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters
	parameter CLK_PERIOD = 10;

	//Registers and wires
	reg clk;
	reg [2:0] a;
	reg [2:0] b;
	reg read;
	reg err;

	wire [5:0] result;

	//Clock generation
	initial
	begin
	clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	//Testing
	initial begin
		read=1;
		err=0;
		a<=3'd5;
		b<=3'd6;
		#20
		if(result!=6'd30)
      		begin //Test for alternating between dice and button
          		$display("***TEST FAILED! 5x6=30! result==30, actual result=%d ***",result);
          		err=1;
       		end
		a<=3'd2;
		b<=3'd6;
		#20
		if(result!=6'd12)
      		begin //Test for alternating between dice and button
          		$display("***TEST FAILED! 2x6=12! result==12, actual result=%d ***",result);
          		err=1;
       		end
		a<=3'd3;
		b<=3'd5;
		read=0;
		#20
		if(result!=6'd12)
      		begin //Test for alternating between dice and button
          		$display("***TEST FAILED! CHECK DISABLE FUNCTIONALITY! result==12, actual result=%d ***",result);
          		err=1;
       		end
		read=1;
		#20
		if(result!=6'd15)
      		begin //Test for alternating between dice and button
          		$display("***TEST FAILED! CHECK ENABLE FUNCTIONALITY! result==15, actual result=%d ***",result);
          		err=1;
       		end
	end
		 
	//Finish simulation and check for success
	initial begin
	#150
	if (err==0)
		$display("***TEST PASSED! YOUR RESULT IS: %d***", result);
	$finish;
	end

	//Instantiate module
	multiplier top(
		.clk(clk),
		.a(a),
		.b(b),
		.read(read),
		.result(result)
	);
     
endmodule 

