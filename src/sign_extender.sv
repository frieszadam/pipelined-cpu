/*
	Filename: sign_extender.sv
	Authors: Adam Friesz, Brandon Chang
	Date: July 18th, 2024
	Description: This module is a datapath element for a CPU that outputs a sign extended
	version of the input to facilitate operations with a 64-bit ALU.

	Inputs:
		instruction: the current instruction being processed by the CPU.
		ctrl: selects which section of instruction to sign extend.
			I type:  0b00  	B type:  0b01	CB type: 0b10	D type: 0b11

	Outputs:
		extended: 64 bit sign extended version of the selected portion of the instruction
*/

module sign_extender (instruction, ctrl, extended);
	input logic [31:0] instruction;
	input logic [1:0] ctrl;
	output logic [63:0] extended;
	
	// create sign extender for each format, then use mux to sel between them based on ctrl
	logic [63:0] I_extend;
	logic [63:0] B_extend;
	logic [63:0] CB_extend;
	logic [63:0] D_extend;
	
	// I type [21:10]
	assign I_extend = {52'b0, instruction[21:10]};
	
	// B type [25:0]
	assign B_extend = {{38{instruction[25]}}, instruction[25:0]};
	
	// CB type [23:5]
	assign CB_extend = {{45{instruction[23]}}, instruction[23:5]};
	
	// D type [20:12]
	assign D_extend = {{55{instruction[20]}}, instruction[20:12]};
	
	mux4to1 format_select (ctrl, {D_extend, CB_extend, B_extend, I_extend}, extended);
endmodule  // sign_extender