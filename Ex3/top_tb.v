//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Payas Sinha
// Date: 01/06/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Registers and wires
    reg clk;
    reg rst;
    reg enable;
    reg direction;
    reg err;

    wire [7:0] counter_out;

    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

    //Todo: User logic
    initial begin
	err=0;	
	rst=1;
	enable=1;
	direction=1;
	#20
	if(counter_out!=0)
        begin //test for initialisation
          $display("***TEST FAILED! INITIALISATION INCORRECT! counter_out==0, actual counter_out=%d ***",counter_out);
          err=1;
        end
	rst=0;
	#60
	if(counter_out!=6)
        begin //test for counting up
          $display("***TEST FAILED! COUNT UP NOT WORKING! counter_out==2, actual counter_out=%d ***",counter_out);
          err=1;
        end
	enable=0;
	#20
	if(counter_out!=6)
        begin //test for enable and disable features
          $display("***TEST FAILED! DISABLE COUNTER NOT WORKING! counter_out==2, actual counter_out=%d ***",counter_out);
          err=1;
        end
	enable=1;
	direction=0;
	#30
	if(counter_out!=3)
        begin //test for counting down
          $display("***TEST FAILED! COUNT DOWN NOT WORKING! counter_out==1, actual counter_out=%d ***",counter_out);
          err=1;
        end
	rst=1;
	#20
	if(counter_out!=0)
        begin //test for resetting
          $display("***TEST FAILED! RESET NOT WORKING! counter_out==0, actual counter_out=%d ***",counter_out);
          err=1;
        end
    end

    //Todo: Finish test, check for success
    initial begin
       #150 
       if (err==0)
         $display("***TEST PASSED! :) ***");
       $finish;
     end

    //Todo: Instantiate counter module
    counter top (
    .clk (clk),
    .rst (rst),
    .enable (enable),
    .direction (direction),
    .counter_out (counter_out)
    );
 
endmodule 
