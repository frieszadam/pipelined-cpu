/*
    Filename: IDEX_reg.sv
    Authors: Adam Friesz, Brandon Chang
    Description: This is a pipeline register serving to reduce the critical path of a CPU. This register is located
    between the instruction decode and execution stages.
*/

`include "macros.txt"
module IDEX_reg (   input logic clk,

                    input logic ALUSrc, LDUR, Mem2Reg, MemWrite, RegWrite, setFlags, is_BR, BL,
						  input logic [2:0] ALUop,
                    
                    input logic [4:0] instr_Rn, instr_Rm, instr_Rd,
                    input logic [63:0] reg_read_data1, reg_read_data2, se_data_extended, IFID_PC_p4,
                    
						  output logic IDEX_ALUSrc, IDEX_ldur, IDEX_setFlags, IDEX_is_BR, IDEX_BL,
                    output logic IDEX_Mem2Reg, IDEX_MemWrite, IDEX_RegWrite,
						  output logic [2:0] IDEX_ALUop,

                    output logic [4:0] IDEX_Rn, IDEX_Rm, IDEX_Rd,
                    output logic [63:0] IDEX_reg_read_data1, IDEX_reg_read_data2, IDEX_se_data_extended, IDEX_PC_p4);
                    
    // Controls                
    register #(1) reg_alusrc (.clk, .en(1'b1), .d(ALUSrc), .q(IDEX_ALUSrc));
    register #(1) reg_ldur (.clk, .en(1'b1), .d(LDUR), .q(IDEX_ldur));
    register #(1) reg_mem2reg (.clk, .en(1'b1), .d(Mem2Reg), .q(IDEX_Mem2Reg));
    register #(1) reg_memwrite (.clk, .en(1'b1), .d(MemWrite), .q(IDEX_MemWrite));
	 register #(1) reg_write (.clk, .en(1'b1), .d(RegWrite), .q(IDEX_RegWrite));
	 register #(1) reg_flag (.clk, .en(1'b1), .d(setFlags), .q(IDEX_setFlags));
	 register #(1) reg_isBR (.clk, .en(1'b1), .d(is_BR), .q(IDEX_is_BR));
	 register #(1) reg_BL (.clk, .en(1'b1), .d(BL), .q(IDEX_BL));

	 register #(3) reg_aluop (.clk, .en(1'b1), .d(ALUop), .q(IDEX_ALUop));
	 
    register #(5) reg_rn (.clk, .en(1'b1), .d(instr_Rn), .q(IDEX_Rn));
    register #(5) reg_rm (.clk, .en(1'b1), .d(instr_Rm), .q(IDEX_Rm));
    register #(5) reg_rd (.clk, .en(1'b1), .d(instr_Rd), .q(IDEX_Rd));

    register #(64) reg_rdata1 (.clk, .en(1'b1), .d(reg_read_data1), .q(IDEX_reg_read_data1));
    register #(64) reg_rdata2 (.clk, .en(1'b1), .d(reg_read_data2), .q(IDEX_reg_read_data2));
    register #(64) reg_se_extended (.clk, .en(1'b1), .d(se_data_extended), .q(IDEX_se_data_extended));
    register #(64) reg_pc_p4 (.clk, .en(1'b1), .d(IFID_PC_p4), .q(IDEX_PC_p4));

endmodule // IDEX_reg