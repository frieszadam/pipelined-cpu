// 5 input multiplexer, if invalid sel, out = 0
`include "macros.txt"
module mux5to1 #(DATA_WIDTH) (in, sel, out);
	input logic [0:4][DATA_WIDTH-1:0] in;
	input logic [2:0] sel;
	output logic [DATA_WIDTH-1:0] out;
	
	logic [DATA_WIDTH-1:0] 	or1, // output wires 
				out0, out1, out2, out3, out4; // ({B, add_sub_out, and_out, or_out, xor_out})
	logic [2:0] not_sel;
	not(not_sel[0], sel[0]);
	not(not_sel[1], sel[1]);
	not(not_sel[2], sel[2]);

	genvar i;
	generate
		for (i = 0; i < DATA_WIDTH; i = i+1) begin : generate_out
			and (out0[i], in[0][i], not_sel[2], not_sel[1], not_sel[0]); // PASS_B - 3'b000
			and (out1[i], in[1][i], not_sel[2], sel[1]); // ADD - 3'b010, SUBTRACT - 3'b011 --> 3'b01x
			and (out2[i], in[2][i], sel[2], not_sel[1], not_sel[0]); // AND - 3'b100
			and (out3[i], in[3][i], sel[2], not_sel[1], sel[0]); // OR - 3'b101
			and (out4[i], in[4][i], sel[2], sel[1], not_sel[0]); // XOR - 3'b110
			or  (or1[i], out0[i], out1[i], out2[i], out3[i]);
			or  (out[i], or1[i], out4[i]);
		end
	endgenerate

endmodule // mux_8to1