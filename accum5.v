module accum5(
   // Outputs
   sum,
   // Inputs
   i0, clk, reset,cnt
   );
  input [9:0] i0;
   input      clk, reset;
   input [3:0] cnt;
   output [9:0]	sum;

   wire [9:0]	reg_out;
   wire		co,ci;
   // Beginning of automatic regs (for this module's undeclared outputs)
   wire [9:0]		sum;
   // End of automatics

   full_adder_5to10 fa(
		       // Outputs
		       .sum		(sum[9:0]),
		       // Inputs
		       .i0		(i0[9:0]),
		       .i1		(reg_out[9:0]));
     reg5 register(
		   // Outputs
		   .reg_out		(reg_out[9:0]),
		   // Inputs
		   .i0			(sum[9:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .cnt			(cnt[3:0]));
endmodule // accum5

