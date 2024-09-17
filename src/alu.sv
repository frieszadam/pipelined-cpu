/*
	Authors: Adam Friesz, Brandon Chang
	Description: This module is a 64 bit ALU supporting, addition, subtraction, anding,
	oring, xoring, and pass b operations. 

	inputs:
		A, B : 64 bit values to add or subtract together.
		cntrl: selector signal to tell ALU what op to perform
		000:			result = B
		010:			result = A + B
		011:			result = A - B
		100:			result = bitwise A & B
		101:			result = bitwise A | B
		110:			result = bitwise A XOR B

	outputs:
		result: the result of the operation.
		negative: is result negative? (only makes sense if adding or subbing)
		zero: is the result zero?
		overflow: was there overflow?
		carry_out: was there a carry_out
*/
`include "macros.txt"
`define DATA_WIDTH 64
module alu (A, B, cntrl, result, negative, zero, overflow, carry_out);
	input logic [`DATA_WIDTH-1:0] A, B;
	input logic [2:0] cntrl;
	output logic [`DATA_WIDTH-1:0] result;
	output logic negative, zero, overflow, carry_out;
		
	// local variables
	logic [`DATA_WIDTH-1:0] and_out, or_out, xor_out, add_sub_out;
	genvar i;
	
	// and
	generate
		for (i = 0; i < `DATA_WIDTH; i = i+1) begin : generate_and
			and `DELAY (and_out[i], A[i], B[i]);
		end
	endgenerate

	
	// or
	generate
		for (i = 0; i < `DATA_WIDTH; i = i+1) begin : generate_or
			or `DELAY (or_out[i], A[i], B[i]);
		end
	endgenerate


	// xor
	generate
		for (i = 0; i < `DATA_WIDTH; i = i+1) begin : generate_xor
			xor `DELAY (xor_out[i], A[i], B[i]);
		end
	endgenerate
	
	// add and subtract
	//	rc_add_sub #(`DATA_WIDTH) add_sub (.A, .B, .sub(), .R(add_sub_out), .overflow, .carry_out); // full adder
	CLA_64bit carry_look_ahead (.A, .B, .sub(cntrl == 3'b011), .R(add_sub_out), .overflow, .carry_out);
	
	// select between the possible outputs based on cntrl
	mux5to1 #(`DATA_WIDTH) selector (.in({B, add_sub_out, and_out, or_out, xor_out}), .sel(cntrl), .out(result));

//	set zero and negative
	assign negative = result[63];
	
//	assign zero = (result == 64'b0);
	logic [15:0] zero_16;
	logic [3:0] zero_4;
	generate 
		for (i = 0; i < `DATA_WIDTH; i = i + 4) begin : zero_ors_16
			or `DELAY (zero_16[i/4], result[i], result[i+1], result[i+2], result[i+3]);
		end
	endgenerate
	
	generate 
		for (i = 0; i < `DATA_WIDTH/4; i = i + 4) begin : zero_ors_4
			or `DELAY (zero_4[i/4], zero_16[i], zero_16[i+1], zero_16[i+2], zero_16[i+3]);
		end
	endgenerate 
	
	nor `DELAY (zero, zero_4[0], zero_4[1], zero_4[2], zero_4[3]);
	
endmodule //alu
