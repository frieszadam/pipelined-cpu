// This module constructs one 64-bit register with a write enable signal out of
// the provided D_FF module and structural representation.
// Accepts a clock, an enable signal (wren), and a 64-bit input d
// Outputs q which either retains its previous value if ~en, or updates to d on posedge

`include "macros.txt"
module register #(REG_SIZE) (clk, en, d, q); 
	input logic clk, en;
	input logic [REG_SIZE-1:0] d; 
	output logic [REG_SIZE-1:0] q;
	
	// local signals
	logic not_en;
	logic [REG_SIZE-1:0] data_in, data_previous, ff_in;
	not (not_en, en);
	
	genvar i;
	generate
		 for (i = 0; i < REG_SIZE; i=i+1) begin : concatenate_flip_flops
		 	and `DELAY (data_in[i], d[i], en);						        // determine the input based on en
			and `DELAY (data_previous[i], q[i], not_en);                // "                              "
			or `DELAY (ff_in[i], data_in[i], data_previous[i]);         // "                              "

			D_FF regs (.clk(clk), .reset(1'b0), .q(q[i]), .d(ff_in[i])); // combine 1-bit flip flops into 64-bit register
		end
	endgenerate	
endmodule // register