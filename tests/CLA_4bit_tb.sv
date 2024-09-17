module CLA_4bit_tb ();

	logic [3:0] A, B, R;
	logic Cin, PG, GG, Cout;
	
	// instantiate device under test
	CLA_4bit dut (A, B, Cin, R, Cout, PG, GG);

	// simulate thoroughly
	initial begin
		A = 4'd2; B = 4'd3; Cin = 1'b0;
		#10;
		
		A = 4'd9; B = 4'd5; Cin = 1'b0;
		#10;
		
		A = 4'd9; B = 4'd5; Cin = 1'b1;
		#10;
		
		A = 4'd10; B = 4'd7; Cin = 1'b0;
		#10;

		A = 4'd10; B = 4'd5; Cin = 1'b1;
		#10;

	end
endmodule