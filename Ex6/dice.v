//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Payas Sinha
// Date: 01/06/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module diceroll(
    //Add ports
    input clk,
    input rst,
    input button,
    output reg [2:0] throw
    );

    //Define wires
    wire out;

    //Logic for the dice
    always @(posedge clk or posedge rst)
    begin
	if(rst==1)
	   throw<=3'b001;
	else if(throw==3'd0|throw==3'd6)
	   throw<=3'b001;
	else if(button==0)
	   throw<=throw;
        else if(button==1)
           throw<=throw+1;
    end


endmodule
