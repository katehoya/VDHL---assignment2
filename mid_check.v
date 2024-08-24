`include "reg5.v"
`include "sl_reg.v"
`include "sr_reg.v"
`include "mux.v"
`include "full_adder.v"
`include "accum5.v"
`include "full_adder_5to10.v"
`include "counter.v"


module mid_check(
   // Outputs
   mid_check_out,
   // Inputs
   multiplicand, multiplier, clk, reset, cnt
   );
   input [4:0] multiplicand, multiplier;
   input       clk, reset;
   input [3:0] cnt;
   output     [9:0] mid_check_out;


   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [9:0]		sum;		// From accum of accum5.v
   wire [3:0]		counter_out;		// From count of counter.v
   wire [9:0]		mux_out;		// From mu of mux.v
   wire [9:0]		sl_reg_out;		// From reg1 of sl_reg.v
   wire			sr_reg_out;		// From reg2 of sr_reg.v
   // End of automatics

   // Beginning of automatic regs (for this module's undeclared outputs)
   wire		[9:0]	mid_check_out;
   // End of automatics

      counter count(
		 // Outputs
		 .counter_out		(counter_out[3:0]),
		 // Inputs
		 .clk			(clk),
		 .reset			(reset));
   sl_reg reg1(
	       // Outputs
	       .sl_reg_out		(sl_reg_out[9:0]),
	       // Inputs
	       .i0			(multiplicand[4:0]),
	       .reset			(reset),
	       .clk			(clk),
	       .ld			(counter_out));
   sr_reg reg2(
	       // Outputs
	       .sr_reg_out		(sr_reg_out),
	       // Inputs
	       .i0			(multiplier[4:0]),
	       .clk			(clk),
	       .reset			(reset),
	       .ld			(counter_out));
   mux mu(
	  // Outputs
	  .mux_out			(mux_out[9:0]),
	  // Inputs
	  .i0				(sl_reg_out[9:0]),
	  .sel				(sr_reg_out));
   accum5 accum(
		// Outputs
		.sum		(mid_check_out[9:0]),
		// Inputs
		.i0			(mux_out[9:0]),
		.clk			(clk),
		.reset			(reset),
		.cnt			(counter_out[3:0]));
     endmodule // mid_check
