`define DATA_WIDTH 64
`timescale 1 ps / 1 ps

module CLA_64bit_tb ();

	// instantiate testing vars
	logic [`DATA_WIDTH-1:0] A, B, R;
	logic sub, overflow, carry_out;
	logic [11:0][63:0] vals;
	assign vals = {64'd1, 64'd3, 64'd5, 64'd6, 64'd7, 64'd9, 64'd10, 64'd12, 64'd15, 64'd18, 64'd20, 64'd22};
	
	// instantiate dut
	CLA_64bit dut (A, B, sub, R, overflow, carry_out);
		
	initial begin
		sub = 0; // Begin basic addition testing
		for (int i = 0; i < 6; i++) begin
			A = vals[i];
			B = vals[i+1];
			#10;
			
			A = vals[i];
			B = -vals[i+1];
			#10;

			A = -vals[i];
			B = -vals[i+1];
			#10;
		end // addition testing
		
		sub = 1; // Begin subtraction testing
		for (int i = 0; i < 6; i++) begin
			A = vals[i];
			B = vals[i+1];
			#10;
			
			A = vals[i];
			B = -vals[i+1];
			#10;

			A = -vals[i];
			B = -vals[i+1];
			#10;
		end // substraction testing
		
		
		// overflow testing
		sub <= 1; A <= 1 << 63; B <= 64'b1; #10; // add 1 to the max negative - overflow and carryout should be true
		sub <= 0; A <= 1 << 62; B <= 1 << 62; #10; // add two big positive numbers together - overflow should be true
	end
endmodule // CLA_64bit_tb