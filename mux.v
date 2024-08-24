module mux(/*AUTOARG*/
   // Outputs
   mux_out,
   // Inputs
   i0, sel
	   );
  input [9:0] i0;
   input      sel;
   output [9:0]	mux_out;

   assign mux_out = sel ? i0 : 0;
endmodule // mux
 
