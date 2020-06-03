//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Payas Sinha
// Date: 03/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiplier(
	//Define inputs
	input clk,
	input [2:0] a,
	input [2:0] b,
	input read,
	input rst,
	output [5:0] result
	);

	//Define output axi4 registers
	wire rsta_busy;
	wire rstb_busy;
	wire s_axi_awready;
	wire s_axi_wready;
	wire [1:0] s_axi_bresp;
	wire s_axi_bvalid;
	wire s_axi_arready;
	wire [31:0] s_axi_rdata;
	wire [1:0] s_axi_rresp;
	wire s_axi_rvalid;

	//Define input axi4 registers
	wire [31:0] s_axi_awaddr;
	wire [31:0] s_axi_wdata;
	wire [31:0] s_axi_araddr;
    wire [3:0] s_axi_wstrb;

	//Logic
	assign s_axi_araddr[31:0]=(a*8)+b;
	assign s_axi_awaddr[31:0]=0;
	assign s_axi_wdata[31:0]=0;
	assign s_axi_wstrb[3:0]=0;
	assign result[5:0]=s_axi_rdata[5:0];


axi4_multiplier your_instance_name (
  .rsta_busy(rsta_busy),          // output wire rsta_busy
  .rstb_busy(rstb_busy),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(~rst),          // input wire s_aresetn
  .s_axi_awaddr(s_axi_awaddr),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(read),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(s_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(read),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(read),    // input wire s_axi_bready
  .s_axi_araddr(s_axi_araddr),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(read),  // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(s_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(read)    // input wire s_axi_rready
);

endmodule
