//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Todo: Parameters
    parameter CLK_PERIOD = 10;

    //Todo: Registers and wires
    reg clk;
    reg rst;
    reg button;

    wire [2:0] throw;

    //Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

    //Todo: User logic
    initial begin
       rst=1;
       button=1;
       #10
       rst=0;
       #100
       button=0;
    end

    //An initial block that ends the simulation, and declares success (if valid)
    initial begin
       #150
       if (throw!=0)
          $display("Your dice roll is: %d",throw);
       $finish;
    end
     
    //Todo: Instantiate counter module
    diceroll top (
    .clk (clk),
    .rst (rst),
    .button (button),
    .throw (throw)
    );
 
endmodule 
