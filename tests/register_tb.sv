// This module thoroughly simulates register_64
`timescale 1us/1us
module register_tb (); 
	logic clk, en;
	logic [63:0] q;
	logic [63:0] d; 
	
	// instantiate device under test
	register #(64) dut (clk, en, d, q);
	
	// create simulated clock
	always begin
		clk = 1; #5; clk = 0; #5; 
	end
	
	// simulate register_64 thoroughly 
	initial begin
	    // expected behavior: no changes for first 3 clock cycles, then q=500 for 1 cycle, q=250 for 2 cycles
	    for (int i = 0; i < 2; i++) begin
	        en = i;
    		d = 500; @(posedge clk);
    		d = 250;	@(posedge clk);
    					@(posedge clk);
		end
		$stop;
	end // initial

endmodule // register_tb