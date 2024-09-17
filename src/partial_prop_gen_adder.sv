module partial_prop_gen_adder (A, B, Cin, R, P, G);
	input logic A, B, Cin;
	output logic R, P, G;
	
	xor(R, A, B, Cin);
	and(G, A, B);
	or(P, A, B);
	
endmodule // partial_prop_gen_adder