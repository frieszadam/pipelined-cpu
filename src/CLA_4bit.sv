/* 
    description: carry lookahead 4 bit adder
    accepts: 
        A = input1
		B = input2
		Cin = carry in
    returns: 
     	R = result
     	CG = carry out of group
     	PG = propagate of group
     	GG = generate of group 
*/

`include "macros.txt"
module CLA_4bit (A, B, Cin, R, CG, PG, GG);
	input logic [3:0] A, B;
	input logic Cin;
	output logic [3:0] R;
	output logic PG, GG, CG;
	
	// local variables
	logic [3:0] P, G;
	logic [4:0] C;
	
	logic PC, GP, PCP, PGC, PCPP, GPP, GP1, PCPPP, GPPP, GPP1, GP2;
	
	// instantiate 1 bit adders
	partial_prop_gen_adder A0 (A[0], B[0], C[0], R[0], P[0], G[0]);
	partial_prop_gen_adder A1 (A[1], B[1], C[1], R[1], P[1], G[1]);
	partial_prop_gen_adder A2 (A[2], B[2], C[2], R[2], P[2], G[2]);
	partial_prop_gen_adder A3 (A[3], B[3], C[3], R[3], P[3], G[3]);

	// determine carries
	assign C[0] = Cin; // assign a net label for readability
	
	and `DELAY (PC, P[0], C[0]);
	or `DELAY (C[1], G[0], PC);
	
	and `DELAY (GP, G[0], P[1]);
	and `DELAY (PCP, PC, P[1]);
	or `DELAY (C[2], G[1], GP, PCP);
	
	and `DELAY (PCPP, PCP, P[2]);
	and `DELAY (GPP, GP, P[2]);
	and `DELAY (GP1, G[1], P[2]);
	or `DELAY (C[3], G[2], PCPP, GPP, GP1);
	
	and `DELAY (PCPPP, PCPP, P[3]);
	and `DELAY (GPPP, GPP, P[3]);
	and `DELAY (GPP1, GP1, P[3]);
	and `DELAY (GP2, G[2], P[3]);
	or `DELAY (GG, G[3], GPPP, GPP1, GP2);
	or `DELAY (C[4], PCPPP, GG);
	
	and `DELAY(PG, P[0], P[1], P[2], P[3]);
	and `DELAY (PGC, PG, Cin);
	or `DELAY (CG, GG, PGC); // group carry out = group generate | propagate & carry
	
endmodule // CLA_4bit