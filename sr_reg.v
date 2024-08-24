module sr_reg(/*AUTOARG*/
	      // Outputs
	      sr_reg_out,
	      // Inputs
	      i0, clk, reset,ld
	      );
   input [4:0] i0;
   input       clk, reset;
   input [3:0] ld;
   output      sr_reg_out;

   /*AUTOWIRE*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [3:0]   Q;
   wire [3:0]  ns;
   // End of automatics
   assign ns  = (!ld)?i0:{Q[0], Q[3:1]};
   always @ (posedge clk) begin
      Q <= ns;
   end
   assign sr_reg_out = Q[0];
   
endmodule // sr_reg
