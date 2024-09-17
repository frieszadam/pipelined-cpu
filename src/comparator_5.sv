/*
    Filename: comparator_5.sv
    Authors: Adam Friesz, Brandon Chang
    Description: accepts to 5-bit inputs, A and B, and outputs whether every bit is the same.
*/

`include "macros.txt"
module comparator_5 (A, B, result);
	input logic [4:0] A, B;
	output logic result;
	
	logic [4:0] notA, notB, r_00, r_11, r;
	logic temp;
	
	genvar i;
	generate
		for (i = 0; i < 5; i++) begin : make_xnors // xnor
			not `DELAY (notA[i], A[i]);
			not `DELAY (notB[i], B[i]);
			and `DELAY (r_00[i], notA[i], notB[i]);
			and `DELAY (r_11[i], A[i], B[i]);
			or `DELAY (r[i], r_00[i], r_11[i]);
		end
	endgenerate
	
	and `DELAY (temp, r[0], r[1], r[2], r[3]);
	and `DELAY (result, temp, r[4]);

endmodule