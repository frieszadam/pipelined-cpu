/*
    Filename: EXMEM_reg.sv
    Authors: Adam Friesz, Brandon Chang
    Description: This is a pipeline register serving to reduce the critical path of a CPU. This register is located
    between the execution and memory write/read stages.
*/

`include "macros.txt"
module EXMEM_reg (  input logic clk,

                    input logic IDEX_MemWrite, IDEX_Mem2Reg, IDEX_RegWrite, IDEX_BL,
                    input logic [4:0] IDEX_Rn, IDEX_Rm, IDEX_Rd,
                    input logic [63:0] ALU_out, ALUSrc_out, IDEX_PC_p4, ALU_forwardb_out, datamem_write_data,
                    
                    output logic EXMEM_MemWrite, EXMEM_Mem2Reg, EXMEM_RegWrite, EXMEM_BL,
                    output logic [4:0] EXMEM_Rm, EXMEM_Rn, EXMEM_Rd,
                    output logic [63:0] EXMEM_ALU_out, EXMEM_ALUSrc_out, EXMEM_PC_p4, EXMEM_forwardb_out, EXMEM_datamem_write_data);
                    
						  
	 register #(1) reg_memwrite (.clk, .en(1'b1), .d(IDEX_MemWrite), .q(EXMEM_MemWrite));
	 register #(1) reg_mem2reg (.clk, .en(1'b1), .d(IDEX_Mem2Reg), .q(EXMEM_Mem2Reg));
	 register #(1) reg_regwrite (.clk, .en(1'b1), .d(IDEX_RegWrite), .q(EXMEM_RegWrite));
	 register #(1) reg_BL (.clk, .en(1'b1), .d(IDEX_BL), .q(EXMEM_BL));

    register #(5) reg_rn (.clk, .en(1'b1), .d(IDEX_Rn), .q(EXMEM_Rn));    
	 register #(5) reg_rm (.clk, .en(1'b1), .d(IDEX_Rm), .q(EXMEM_Rm));
    register #(5) reg_rd (.clk, .en(1'b1), .d(IDEX_Rd), .q(EXMEM_Rd));

    register #(64) reg_alu_out (.clk, .en(1'b1), .d(ALU_out), .q(EXMEM_ALU_out));
    register #(64) reg_alusrc_out (.clk, .en(1'b1), .d(ALUSrc_out), .q(EXMEM_ALUSrc_out));
	 register #(64) reg_forwardb_out (.clk, .en(1'b1), .d(ALU_forwardb_out), .q(EXMEM_forwardb_out));
    register #(64) reg_pc_p4 (.clk, .en(1'b1), .d(IDEX_PC_p4), .q(EXMEM_PC_p4));
    register #(64) reg_datamem_write_data (.clk, .en(1'b1), .d(datamem_write_data), .q(EXMEM_datamem_write_data));

endmodule // EXMEM_reg