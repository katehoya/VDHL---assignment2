module reg5(
   // Outputs
   reg_out,
   // Inputs
   i0, reset, cnt,clk,
	    );
  
  input [9:0] i0;
   input      reset,clk;
   input [3:0] cnt;
   output [9:0]	reg_out;
   wire [3:0]	cnt;
   reg [9:0]	reg_out;


   always @ (posedge clk) begin
     if(reset || (cnt==0)) begin
       reg_out <= 0;
     end
     else begin
       reg_out <= i0;	  
     end
   end
   
endmodule; // reg
