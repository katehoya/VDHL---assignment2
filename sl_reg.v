module sl_reg(/*AUTOARG*/
   // Outputs
   sl_reg_out,
   // Inputs
   i0, reset, clk, ld
   );

  input [4:0] i0;
   input      reset,clk;
   input [3:0] ld;
   output [9:0]	sl_reg_out;
// Beginning of automatic regs (for this module's undeclared outputs)
   reg [9:0]	Q;
   wire [9:0]	ns;

// End of automatics
   assign ns = (!ld || (ld==5))?i0:(Q<<1);
       always @ (posedge clk) begin
	  Q<=ns;
       end
	  assign sl_reg_out = Q;

//	i1 <= (i1 << 1);
//     end // always @ (posedge clk)
   
endmodule // reg
