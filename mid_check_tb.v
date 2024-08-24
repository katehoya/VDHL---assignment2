`timescale 1ns/1ns
`include "mid_check.v"

module mid_check_tb;
   
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [9:0]		mid_check_out;		// From mc of mid_check.v
   // End of automatics
   reg [4:0]		multiplicand, multiplier;
   reg			clk, reset;
   
   mid_check mc(
		// Outputs
		.mid_check_out		(mid_check_out[9:0]),
		// Inputs
		.multiplicand		(multiplicand[4:0]),
		.multiplier		(multiplier[4:0]),
		.clk			(clk),
		.reset			(reset));
   
   always #5 clk <= ~clk;
   initial
     begin
	$dumpfile("mid_check_tb.vcd");
	$dumpvars(0,mid_check_tb);

	clk=0;
	reset=0;
	multiplier = 2;
	multiplicand = 3;
	#0.5 reset=1;
	#5 reset = 0;
	#58
	  multiplicand = 4;
	multiplier = 3;
	#60 multiplicand = 31;
	multiplier = 31;
	#15

	$finish;
     end // initial begin
endmodule // mid_check_tb
