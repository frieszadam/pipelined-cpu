// zero neg overflow carry_out
/*
	Filename: flag_reg.sv
	Authors: Adam Friesz, Brandon Chang
	Date: July 18th, 2024
	Description: This module is a register that stores flag information set during instructions
	such as ADDS and SUBS.

	Inputs: 
		clk: Clock to run off of.
		flag_input: the flag output of the ALU ordered (MSB) {zero, neg, overflow, carry_out} (LSB)
		en: should we update the flags?
	
	Outputs:
		flag_out: output of the flag register, ordered in same manner as input.

*/
module flag_reg (clk, flag_input, en, flag_out);
	input logic clk, en;
	input logic [3:0] flag_input;
	output logic [3:0] flag_out;
	
	logic [3:0] flag_in;
	
	// mux to either retain previous value or to update
	mux2to1 #(4) sel (en, {flag_input, flag_out}, flag_in);

	// wire up the flip flops
	D_FF flag_zero (.d(flag_in[3]), .q(flag_out[3]), .reset(), .clk);
	D_FF flag_neg (.d(flag_in[2]), .q(flag_out[2]), .reset(), .clk);
	D_FF flag_overflow (.d(flag_in[1]), .q(flag_out[1]), .reset(), .clk);
	D_FF flag_carry_out (.d(flag_in[0]), .q(flag_out[0]), .reset(), .clk);

endmodule // flag_reg