module full_adder_5to10(/*AUTOARG*/
   // Outputs
   sum,
   // Inputs
   i0, i1
			);

  input [9:0] i0, i1;
   output [9:0]	sum;


   // Beginning of automatic regs (for this module's undeclared outputs)
   wire [9:0]		c;
   assign c[0]=0;
   // End of automatics

   genvar i;
   generate
      for(i=0; i<9; i=i+1) begin
	 full_adder fa(.a(i0[i]), .b(i1[i]), .ci(c[i]), .co(c[i+1]), .r(sum[i]));
      end
      full_adder fa_last(.a(i0[9]),.b(i1[0]),.ci(c[9]),.co(),.r(sum[9]));
      endgenerate
endmodule // full_adder_5to10
