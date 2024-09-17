/*
    Filename: MEMWB_reg.sv
    Authors: Adam Friesz, Brandon Chang
    Description: This is a pipeline register serving to reduce the critical path of a CPU. This register is located
    between the memory read/write and register write stages.
*/

`include "macros.txt"
module MEMWB_reg (  input logic clk,
                    input logic EXMEM_RegWrite, EXMEM_Mem2Reg, EXMEM_BL,
                    input logic [4:0] EXMEM_Rd,
                    input logic [63:0] datamem_read_data, EXMEM_ALU_out,  EXMEM_PC_p4, EXMEM_forwardb_out,
                    
                    output logic MEMWB_RegWrite, MEMWB_Mem2Reg, MEMWB_BL,
                    output logic [4:0] MEMWB_Rd,
                    output logic [63:0] MEMWB_datamem_read_data, MEMWB_ALU_out, MEMWB_PC_p4, MEMWB_forwardb_out);
                               
    
    register #(1) reg_regwrite (.clk, .en(1'b1), .d(EXMEM_RegWrite), .q(MEMWB_RegWrite));
	 register #(1) reg_mem2reg (.clk, .en(1'b1), .d(EXMEM_Mem2Reg), .q(MEMWB_Mem2Reg));
	 register #(1) reg_BL (.clk, .en(1'b1), .d(EXMEM_BL), .q(MEMWB_BL));

    register #(5) reg_instruction (.clk, .en(1'b1), .d(EXMEM_Rd), .q(MEMWB_Rd));
    register #(64) reg_read_data (.clk, .en(1'b1), .d(datamem_read_data), .q(MEMWB_datamem_read_data));
    register #(64) reg_alu_out (.clk, .en(1'b1), .d(EXMEM_ALU_out), .q(MEMWB_ALU_out));
    register #(64) reg_pc_p4 (.clk, .en(1'b1), .d(EXMEM_PC_p4), .q(MEMWB_PC_p4));
    register #(64) reg_forwardb (.clk, .en(1'b1), .d(EXMEM_forwardb_out), .q(MEMWB_forwardb_out));

endmodule // MEMWB_reg