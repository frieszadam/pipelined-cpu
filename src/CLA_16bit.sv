/* 
	Authors: Adam Friesz
	Description: 16 bit carry lookahead unit composed of 4 4bit carry look ahead adders.
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
module CLA_16bit (A, B, Cin, R, CG, PG, GG);
	input logic [15:0] A, B;
	input logic Cin;
	output logic [15:0] R;
	output logic PG, GG, CG;
	
	// local variables
	logic [3:0] P, G;
	logic [4:0] C;
	logic [3:0] CG_in;
	
	logic PC, GP, PCP, PCPP, GPP, GP1, PCPPP, GPPP, GPP1, GP2, PGC;
	
	// instantiate 1 bit adders
	CLA_4bit A0 (A[3:0], B[3:0], C[0], R[3:0], CG_in[0], P[0], G[0]); // CLA_4bit (A, B, Cin, R, CG, PG, GG);
	CLA_4bit A1 (A[7:4], B[7:4], C[1], R[7:4], CG_in[1], P[1], G[1]);
	CLA_4bit A2 (A[11:8], B[11:8], C[2], R[11:8], CG_in[2], P[2], G[2]);
	CLA_4bit A3 (A[15:12], B[15:12], C[3], R[15:12], CG_in[3], P[3], G[3]);

	// determine carries
	assign C[0] = Cin; // assign a net label for readability
	
	and `DELAY(PC, P[0], C[0]);
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
	
	and `DELAY (PG, P[0], P[1], P[2], P[3]);
	and `DELAY (PGC, PG, Cin);
	or `DELAY (CG, GG, PGC); // group carry out = group generate | propagate & carry
	
endmodule // CLA_16bit