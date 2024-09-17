/*
    Filename: IFID_reg.sv
    Authors: Adam Friesz, Brandon Chang
    Description: This is a pipeline register serving to reduce the critical path of a CPU. This register is located
    between the instruction fetch and instruction decode stages.
*/

`include "macros.txt"
module IFID_reg (   input logic clk,
                    input logic [31:0] instruction,
                    input logic [63:0] PC_out, PC_p4,
                    output logic [31:0] IFID_instruction,
                    output logic [63:0] IFID_PC_normal, IFID_PC_p4);
	
    register #(32) reg_instruction (.clk, .en(1'b1), .d(instruction), .q(IFID_instruction));
    register #(64) reg_pc_normal (.clk, .en(1'b1), .d(PC_out), .q(IFID_PC_normal));
    register #(64) reg_pc_p4 (.clk, .en(1'b1), .d(PC_p4), .q(IFID_PC_p4));

endmodule // IFID_reg