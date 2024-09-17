// This module constructs a 32:1 multiplexer by connecting 2, 16:1 muxes with a 2:1 mux.
// Accepts a 5 bit selector signal, and an array of 32, 64-bit inputs.
// Outputs the correctly determined 64-bit input based on sel

`include "macros.txt"
module mux32to1 (sel, in, out);
	input logic [4:0] sel;
	input logic [31:0] [63:0] in; // try changing to packed packed
	output logic [63:0] out;
	
	// local signals
	logic [63:0] outline0, outline1, out0, out1;
	logic notsel4;
	genvar i;
	not (notsel4, sel[4]);

	// instantiate 16:1 multiplexers
	mux16to1 mux0 (sel[3:0], in[15:0], outline0);
	mux16to1 mux1 (sel[3:0], in[31:16], outline1);

    // create 2:1 mux and use it to select between outputs from 16:1 based on MSB of sel
	generate
		for (i = 0; i < 64; i = i+1) begin : generate_out_signal
			and `DELAY (out0[i], outline0[i], notsel4);
			and `DELAY (out1[i], outline1[i], sel[4]);
			or `DELAY (out[i], out0[i], out1[i]);
		end
	endgenerate
	
endmodule // 32to1mux