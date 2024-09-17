// This module thoroughly simulates mux32to1, which also encompasses testing of mux4to1 and mux16to1

`timescale 1us / 1us
module mux_tb();
	logic [4:0] sel;
	logic [31:0] [63:0] in;
	logic [63:0] out;
	
	// define device under test
	mux32to1 dut (sel, in, out);
	
	// local variables
	logic [63:0] ans;
	assign ans = in[sel];
	
	// As the dut is purely combinatorial, no simulated clock is needed
	// If no FAIL messages are shown in the simulation log the mux is verified
	initial begin
		for (int i = 0; i < 32; i = i+1)
			in[i] = i;
		
		for (int i = 0; i < 32; i = i+1) begin
			sel = i;
			if (out!=ans)
				$display("FAIL");
			#5;
		end
		
		for (int i = 0; i < 32; i = i+1)
			in[i] = i > 15? 1: 0;

		for (int i = 0; i < 32; i = i+1) begin
			sel = i;
			if (out!=ans)
				$display("FAIL");
			#5;
		end
		
		for (int i = 0; i < 32; i = i+1)
			in[i] = i%3==1? 1: 0;

		for (int i = 0; i < 32; i = i+1) begin
			sel = i;
			if (out!=ans)
				$display("FAIL");
			#5;
		end
	end // initial
endmodule // mux_tb