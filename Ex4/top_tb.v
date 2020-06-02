//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Payas Sinha
// Date: 01/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Define parameters
    parameter CLK_PERIOD = 10;

    //Define registers
    reg clk;
    reg rst;
    reg button;
    reg err;

    //Define wires
    wire [2:0] throw;

    //Generate clock
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

    //Testing procedure
    initial begin
       err=0;
       rst=1;
       button=0;
       #CLK_PERIOD
       if(throw!=3'd1)
       begin //test for initialisation
          $display("***TEST FAILED! INITIALISATION INCORRECT! throw==1, actual counter_out=%d ***",throw);
          err=1;
       end
       rst=0;
       button=1;
       #CLK_PERIOD
       if(throw!=3'd2)
       begin //test for increment
          $display("***TEST FAILED! INCORRECT VALUE! throw==2, actual counter_out=%d ***",throw);
          err=1;
       end
       #CLK_PERIOD
       if(throw!=3'd3)
       begin //test for increment
          $display("***TEST FAILED! INCORRECT VALUE! throw==3, actual counter_out=%d ***",throw);
          err=1;
       end
       #CLK_PERIOD
       if(throw!=3'd4)
       begin //test for increment
          $display("***TEST FAILED! INCORRECT VALUE! throw==4, actual counter_out=%d ***",throw);
          err=1;
       end
       #CLK_PERIOD
       if(throw!=3'd5)
       begin //test for increment
          $display("***TEST FAILED! INCORRECT VALUE! throw==5, actual counter_out=%d ***",throw);
          err=1;
        end
       #CLK_PERIOD
       if(throw!=3'd6)
        begin //test for increment
          $display("***TEST FAILED! INCORRECT VALUE! throw==6, actual counter_out=%d ***",throw);
          err=1;
        end
       #CLK_PERIOD
       if(throw!=3'd1)
        begin //test for setting 7 to 1
          $display("***TEST FAILED! COUNT UP TO 6! throw==1, actual counter_out=%d ***",throw);
          err=1;
        end
       button=0;
       #CLK_PERIOD
       #CLK_PERIOD
       if(throw!=3'd1)
        begin //test for button off
          $display("***TEST FAILED! BUTTON NOT WORKING! throw==1, actual counter_out=%d ***",throw);
          err=1;
        end
       button=1;
       #CLK_PERIOD
       #CLK_PERIOD
       rst=1;
       #CLK_PERIOD
       if(throw!=3'd1)
        begin //test for reset
          $display("***TEST FAILED! RESET NOT WORKING! throw==1, actual counter_out=%d ***",throw);
          err=1;
        end
	rst=0;
    end

    //An initial block that ends the simulation, and declares success (if valid)
    initial begin
       #130
       if (err==0)
         $display("***TEST PASSED!***");
       $finish;
    end

    //Counter module
    diceroll top (
    .clk (clk),
    .rst (rst),
    .button (button),
    .throw (throw)
    );
 
endmodule 
