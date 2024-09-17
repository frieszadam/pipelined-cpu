// This module constructs a 4:1 multiplexer using structural specification.
// Accepts a 2 bit selector signal and an array of 4, 64-bit inputs.
// Outputs the correct 64-bit input based on the value of sel. 

`include "macros.txt"
module mux4to1 #(DATA_WIDTH=64) (sel, in, out);
	input logic [1:0] sel;
	input logic [3:0] [DATA_WIDTH-1:0] in; // try changing to packed array input logic [3:0] [63:0] in;
	output logic [DATA_WIDTH-1:0] out;

    // define and instantiate local signals
	logic [DATA_WIDTH-1:0] out0, out1, out2, out3;
	logic not0, not1;
	
	not `DELAY (not0, sel[0]);
	not `DELAY (not1, sel[1]);
	
	// create 4:1 muxes for each of the 64 in[i] bits  
	// a circuit diagram will aid in understanding of the following structural code
	genvar i;
	generate
		for (i = 0; i < DATA_WIDTH; i = i+1) begin : generate_out_signal
			and `DELAY (out0[i], in[0][i], not0, not1); 
			and `DELAY (out1[i], in[1][i], sel[0], not1);
			and `DELAY (out2[i], in[2][i], sel[1], not0);
			and `DELAY (out3[i], in[3][i], sel[0], sel[1]);
			or `DELAY (out[i], out0[i], out1[i], out2[i], out3[i]);
		end
	endgenerate
endmodule