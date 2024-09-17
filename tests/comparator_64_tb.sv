module comparator_64_tb ();

	logic [63:0] A, B;
	logic result;
	comparator_64 dut (.*);
	
	initial begin
		A = 5; B = 6; #5;
		A = 10; B = 10; #5;
		A = -55; B = 55; #5
		A = -55; B = -55; #5;
	end

endmodule // comparator_64_tb