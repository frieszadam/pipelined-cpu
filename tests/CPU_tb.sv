`timescale 1ns/10ps

module CPU_tb ();
	parameter ClockDelay = 7;

	// local variables
	logic clk, reset;
	
	// instantiate device under test
	CPU_pipelined dut (.*);
	
	// set up simulated clock
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	
	// simulate
	initial begin
		reset = 1; @(posedge clk);
		reset = 0; @(posedge clk);
		
		repeat (1500)
			@(posedge clk);
		$stop;
	end
endmodule
