// This module constructs a 2:1 multiplexer using structural specification.
// Accepts a selector signal and an array of 2, 64-bit inputs.
// Outputs the correct 64-bit input based on the value of sel. 

`include "macros.txt"
module mux2to1 #(DATA_WIDTH) (sel, in, out);
	input logic sel;
	input logic [1:0] [DATA_WIDTH-1:0] in;
	output logic [DATA_WIDTH-1:0] out;

    // define and instantiate local signals
	logic [DATA_WIDTH-1:0] out0, out1;
	logic not0, not1;
	
	not `DELAY (not0, sel);
	
	
	// create 2:1 muxes for each of the 64 in[i] bits  
	// a circuit diagram will aid in understanding of the following structural code
	genvar i;
	generate
		for (i = 0; i < DATA_WIDTH; i = i+1) begin : generate_out_signal
			and `DELAY (out0[i], in[0][i], not0); 
			and `DELAY (out1[i], in[1][i], sel);
			or `DELAY (out[i], out0[i], out1[i]);
		end
	endgenerate
endmodule