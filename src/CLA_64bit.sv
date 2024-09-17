/* 
	Authors: Adam Friesz, Brandon Chang
	Description: 64-bit carry lookahead with 4 16bit units, each composed of a 4bit adder
	accepts: 
		A = input1
		B = input2
		sub = whether to subtract
	returns: 
		R = result
		CG = carry out of group
		PG = propagate of group
		GG = generate of group 
*/
`include "macros.txt"
module CLA_64bit (A, B, sub, R, overflow, carry_out);
	input logic [63:0] A, B;
	input logic sub;
	output logic [63:0] R;
	output logic carry_out, overflow;
	
	// local signals
	logic [63:0] Bin;
	logic [3:0] PG, GG;
	logic [4:0] C;
	logic negA, negB, negR, o1, o2;
	genvar i;
	
	// negator
	generate
		for (i = 0; i < 64; i = i+1) begin : selective_inverter
			xor `DELAY (Bin[i], sub, B[i]);
		end
	endgenerate
	
	CLA_16bit add0 (.A(A[15:0]), .B(Bin[15:0]), .Cin(C[0]), .R(R[15:0]), .CG(C[1]), .PG(PG[0]), .GG(GG[0]));
	CLA_16bit add1 (.A(A[31:16]), .B(Bin[31:16]), .Cin(C[1]), .R(R[31:16]), .CG(C[2]), .PG(PG[1]), .GG(GG[1]));
	CLA_16bit add2 (.A(A[47:32]), .B(Bin[47:32]), .Cin(C[2]), .R(R[47:32]), .CG(C[3]), .PG(PG[2]), .GG(GG[2]));
	CLA_16bit add3 (.A(A[63:48]), .B(Bin[63:48]), .Cin(C[3]), .R(R[63:48]), .CG(C[4]), .PG(PG[3]), .GG(GG[3]));

	// connecting wires
	assign C[0] = sub;
	assign carry_out = C[4];
	
	not `DELAY (negA, A[63]);
	not `DELAY (negB, Bin[63]);
	not `DELAY (negR, R[63]);
	and `DELAY (o1, negA, negB, R[63]);
	and `DELAY (o2, A[63], Bin[63], negR);
	or  `DELAY (overflow, o1, o2);
	
endmodule // CLA_64bit
