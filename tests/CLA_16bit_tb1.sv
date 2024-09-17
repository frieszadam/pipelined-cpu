// Simulates CLA_16bit
module CLA_16bit_tb1 ();
	logic [15:0] A, B, R;
	logic Cin, PG, CG, GG, Cout;
	
	// instantiate device under test
	CLA_16bit dut (A, B, Cin, R, CG, PG, GG);

	// simulate thoroughly
	initial begin
		A = 16'd2; B = 16'd3; Cin = 1'b0;
		#10;
		
		A = 16'd9; B = 16'd5; Cin = 1'b0;
		#10;
		
		A = 16'd65500; B = 16'd35; Cin = 1'b0;
		#10;
		
		A = 16'd65500; B = 16'd35; Cin = 1'b1;
		#10;

		A = 16'd65500; B = 16'd500; Cin = 1'b0;
		#10;
	end
endmodule
