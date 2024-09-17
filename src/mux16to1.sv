// This module constructs a 16:1 multiplexer by connecting 5 4:1 muxes.
// Accepts a 4 bit selector signal, and an array of 16, 64-bit inputs.
// Outputs the correctly determined 64-bit input based on sel

`include "macros.txt"
module mux16to1 (sel, in, out);
	input logic [3:0] sel;
	input logic [15:0] [63:0] in; // packed and unpacked (unpacked = after name) try changing to packed
	output logic [63:0] out;
	
	//logic [63:0] out0, out1, out2, out3;
	logic [3:0] [63:0] outs;

	
	mux4to1 mux0 (sel[1:0], in[3:0], outs[0]);
	mux4to1 mux1 (sel[1:0], in[7:4], outs[1]);
	mux4to1 mux2 (sel[1:0], in[11:8], outs[2]);
	mux4to1 mux3 (sel[1:0], in[15:12], outs[3]);
	mux4to1 sel_mux (sel[3:2], outs, out); // this mux selects between the 4 mux outputs based on the 2 MS bits of sel

endmodule