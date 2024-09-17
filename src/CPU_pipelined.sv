/*
	Filename: CPU_pipelined.sv
	Authors: Adam Friesz, Brandon Chang
	Date: July 18th, 2024
	Description: This top-level module combines components of a processor's datapath and control
	to make a functional 5-stage piplined CPU designed to execute LEGv8 ARM instructions.
	An ALU, instruction memory, data memory, register file, flag registers, sign extender, program
	counter, and control unit are stitched together using various sized multiplexers.
	
	5 pipeline stages listed below:
		Instruction fetch
		Instruction decode (register read)
		Execute
		Memory read/write
		Register write back
		
	4 Pipeline registers are present, dividing the different stages and reducing the critical path by
	approximately a factor of 4, given large enough instruction counts.
*/

`include "macros.txt"
module CPU_pipelined (clk, reset);
	input logic clk, reset;
		
	// cpu_ctrl
	logic MemWrite, ALUSrc, RegWrite, Reg2Loc, Uncondbranch, Branch, Mem2Reg, setFlags, BLT, BL, LDUR, is_BR;
	
	// PC
	logic [63:0] PC_BR_val, PC_out, PC_p4, PC_branch_taken_val, PC_non_BR_branch_val;
	
	// regfile
	logic [63:0] reg_read_data1, reg_read_data2;
	
	// Datamem
	logic [63:0] datamem_write_data;
	
	// IFID
	logic [4:0] instr_Rn, instr_Rm, instr_Rd;
	logic [63:0] IFID_PC_normal, IFID_PC_p4, instr_read_addr;
	logic [31:0] instruction, IFID_instruction;
	logic [1:0] forward_CBZ;
	
	// IDEX
	logic [4:0] IDEX_Rn, IDEX_Rm, IDEX_Rd, reg_read_addr2;
	logic [63:0] IDEX_reg_read_data2, IDEX_reg_read_data1, IDEX_se_data_extended, se_data_extended, IDEX_PC_p4;
	logic takeBranch, IDEX_ldur, IDEX_Mem2Reg, IDEX_MemWrite, IDEX_RegWrite, IDEX_setFlags, IDEX_is_BR, IDEX_BL;
	
	logic [31:0] IDEX_instruction;
	logic [1:0] se_ctrl, BL_ForwardA, BL_ForwardB, BL_Forward_Rd, BR_Forward;
	logic [2:0] IDEX_ALUop, ALUop;
	
	// EXMEM
	logic EXMEM_MemWrite, EXMEM_Mem2Reg, EXMEM_RegWrite, EXMEM_BL, BL_detected_A, BL_detected_B, BL_detected;
	logic [63:0] ALU_out, EXMEM_ALU_out, EXMEM_ALUSrc_out, EXMEM_forwardb_out, EXMEM_forward_data, EXMEM_PC_p4,
					CBZ_check_data, EXMEM_data_mem_read_data, ALUb_STUR_BL_in, EXMEM_datamem_write_data;
	logic [31:0] EXMEM_instruction;
	logic [4:0] EXMEM_Rn, EXMEM_Rm, EXMEM_Rd;
	
	// MEMWB
	logic [63:0] datamem_read_data, MEMWB_datamem_read_data, MEMWB_ALU_out, MEMWB_data_out, program_counter_in,
	reg_write_data, MEMWB_PC_p4, ALU_a, ALU_b, ALU_forwardb_out, ALUSrc_out, MEMWB_forward_data, MEMWB_forwardb_out;
	
	logic MEMWB_RegWrite, MEMWB_Mem2Reg, MEMWB_BL, EXMEM_STUR;
	logic [31:0] MEMWB_instruction;
	logic [4:0] MEMWB_Rd;
	logic [1:0] ForwardA, ForwardB, ALU_ForwardA, ALU_ForwardB, forward_datamem_write_data;
	
	
	// flag registers and alu outputs
	logic flag_neg, flag_zero, flag_overflow, flag_carry_out, alu_neg, alu_zero, alu_overflow, alu_carry_out;
	logic isZero, IDEX_ALUSrc;
	
	//assign instr_Rd = IFID_instruction[4:0];
	assign instr_Rn = IFID_instruction[9:5];
	assign instr_Rm = IFID_instruction[20:16];
	assign ALUSrc_out = ALU_b;
	
	and `DELAY (is_BR, Reg2Loc, Uncondbranch);
	assign EXMEM_STUR = EXMEM_MemWrite;
	// PIPELINE REGISTERS
	IFID_reg IFID_pipe_reg (.*);
	
	IDEX_reg IDEX_pipe_reg (.*);

	EXMEM_reg EXMEM_pipe_reg (.*);
				 
	MEMWB_reg MEMWB_pipe_reg (.*);
                    

	// instantiate datapath elements	
	
//	STUR_forwarder STUR_fu (.IDEX_Rd, .EXMEM_Rd, .MEMWB_Rd, .EXMEM_STUR, .EXMEM_RegWrite, .MEMWB_RegWrite, .forward_datamem_write_data);
	
	mux4to1 #(64) mux_BL_STUR_forward_Rd (.sel(BL_Forward_Rd), .in({EXMEM_PC_p4, MEMWB_PC_p4, EXMEM_PC_p4, IDEX_reg_read_data2}), .out(ALUb_STUR_BL_in));
//	mux4to1 #(64) mux_datamem_write_data (.sel(forward_datamem_write_data), .in({EXMEM_forwardb_out, EXMEM_forwardb_out, MEMWB_data_out, ALU_forwardb_out}), .out(datamem_write_data));
	assign datamem_write_data = ALU_forwardb_out;
//	mux2to1 #(64) mux_data_v_ALU (.sel(EXMEM_Mem2Reg), .in({datamem_read_data, EXMEM_ALU_out}), .out(EXMEM_data_mem_read_data));
	
	datamem datamem (.address(EXMEM_ALU_out), .write_enable(EXMEM_MemWrite), .read_enable(~EXMEM_MemWrite),
	.write_data(EXMEM_datamem_write_data), .clk, .xfer_size(4'b1000), .read_data(datamem_read_data));
		
	alu ALU (.A(ALU_a), .B(ALU_b), .cntrl(IDEX_ALUop), .result(ALU_out),
				.negative(alu_neg), .zero(alu_zero), .overflow(alu_overflow), .carry_out(alu_carry_out));
	
	fowarding_unit fu (.MEMWB_RegWrite, .EXMEM_RegWrite, .IDEX_MemWrite, .MEMWB_Rd, .EXMEM_Rd, .IDEX_Rn, .IDEX_Rm, .IDEX_Rd, .ForwardA, .ForwardB);
							 
	BL_forwarder BL_fu (.IDEX_Rn, .IDEX_Rm, .IDEX_Rd, .IDEX_MemWrite, .EXMEM_BL, .MEMWB_BL, .BL_ForwardA, .BL_ForwardB, .BL_Forward_Rd);
	
	or `DELAY (BL_detected_A, BL_ForwardA[0], BL_ForwardA[1]);
	or `DELAY (BL_detected_B, BL_ForwardB[0], BL_ForwardB[1]);
	or `DELAY (BL_detected, BL_detected_A, BL_detected_B);
	
	// select which forwarding control signal we want to send
	mux2to1 #(2) mux_ctrl_forwardA (.sel(BL_detected_A), .in({BL_ForwardA, ForwardA}), .out(ALU_ForwardA));
	mux2to1 #(2) mux_ctrl_forwardB (.sel(BL_detected_B), .in({BL_ForwardB, ForwardB}), .out(ALU_ForwardB));

	mux2to1 #(64) mux_data_forwardA (.sel(BL_detected), .in({EXMEM_PC_p4, EXMEM_ALU_out}), .out(EXMEM_forward_data));
	mux2to1 #(64) mux_data_forwardB (.sel(BL_detected), .in({MEMWB_PC_p4, MEMWB_data_out}), .out(MEMWB_forward_data));  // forwarded data from MEMWB stage

	// FORWARDING MUXES - for ALU ops and BL
	mux4to1 #(64) forward_muxA (.sel(ALU_ForwardA), .in({EXMEM_PC_p4, EXMEM_forward_data, MEMWB_forward_data,
										IDEX_reg_read_data1}), .out(ALU_a)); 
										
	mux4to1 #(64) forward_muxB (.sel(ALU_ForwardB), .in({EXMEM_PC_p4, EXMEM_forward_data, MEMWB_forward_data,
										ALUb_STUR_BL_in}), .out(ALU_forwardb_out)); 
										
	
	regfile register (.ReadRegister1(IFID_instruction[9:5]), .ReadRegister2(reg_read_addr2),
							.WriteRegister(MEMWB_Rd), .WriteData(reg_write_data), .RegWrite(MEMWB_RegWrite), 
							.clk, .ReadData1(reg_read_data1), .ReadData2(reg_read_data2));
	
	branch_check to_Branch_or_not_to_Branch (.*);

	// CBZ FORWARDING & isZero LOGIC
	CBZ_forwarder CBZ_fu (.instr_Rd, .IDEX_Rd, .EXMEM_Rd, .IDEX_RegWrite, .EXMEM_RegWrite, .forward_CBZ);
	mux2to1 #(64) mux_data_v_ALU (.sel(EXMEM_Mem2Reg), .in({datamem_read_data, EXMEM_ALU_out}), .out(EXMEM_data_mem_read_data));
	mux4to1 #(64) mux_CBZ_val_to_check (.sel(forward_CBZ), .in({ALU_out, ALU_out, EXMEM_data_mem_read_data, reg_read_data2}), .out(CBZ_check_data));
	zero_comparator_64 branch_check_combinational (.A(CBZ_check_data), .isZero);
						
	sign_extender se (.instruction(IFID_instruction), .ctrl(se_ctrl), .extended(se_data_extended));
	
	// program counter logic
	mux4to1 #(64) pc_sel (.sel({reset, takeBranch}), .in({64'b0, 64'b0, PC_branch_taken_val, PC_p4}), .out(program_counter_in));
	register #(64) program_counter_register(.clk, .en(1'b1), .d(program_counter_in), .q(PC_out));
	// in IF stage
	CLA_64bit plus4_program_counter (.A(PC_out), .B(64'd4), .sub(1'b0), .R(PC_p4), .overflow(), .carry_out());
	// in ID stage
 	CLA_64bit plusbranch_program_counter (.A(IFID_PC_normal), .B({se_data_extended[61:0], 2'b0}),
													.sub(1'b0), .R(PC_non_BR_branch_val), .overflow(), .carry_out());
	
	BR_forwarder BR_fu (.instr_Rd, .IDEX_Rd, .EXMEM_Rd, .IDEX_RegWrite, .EXMEM_RegWrite, .BR_Forward);
	mux4to1 #(64) mux_BR_forwarder (.sel(BR_Forward), .in({ALU_out, EXMEM_data_mem_read_data, ALU_out, reg_read_data2}), .out(PC_BR_val));

//	BR_forwarder forwarder_BR (.instr_Rd, .IDEX_Rd, .EXMEM_Rd, .ALU_out, .EXMEM_ALU_out, .reg_read_data2, .PC_BR_val);
	mux2to1 #(64) mux_BR (.sel(is_BR), .in({PC_BR_val, PC_non_BR_branch_val}), .out(PC_branch_taken_val));
	// Throw pc_br_taken_val into a reg? Because is_BR will never be true due to a nop, since PC_BR_val is from the nop cycle, not the BR cycle
	instructmem instruct_mem (.clk, .address(PC_out), .instruction);

	flag_reg flag_register (.clk, .flag_input({alu_neg, alu_zero, alu_overflow, alu_carry_out}),
									.en(IDEX_setFlags), .flag_out({flag_neg, flag_zero, flag_overflow, flag_carry_out}));
									
	// instantiate control unit
	cpu_ctrl ctrl_unit (.instr_MSB(IFID_instruction[31:21]), .Reg2Loc, .Branch, .Mem2Reg, .ALUop, .BL,
							 .MemWrite, .ALUSrc, .RegWrite, .se_ctrl, .Uncondbranch, .setFlags, .BLT, .LDUR);
		
	// instantiate muxes which use control signals as selectors	
	mux2to1 #(64) ALUSrc_mux (.sel(IDEX_ALUSrc), .in({IDEX_se_data_extended, ALU_forwardb_out}), .out(ALU_b)); // Decides between sign extend num and RegB
	mux2to1 #(64) datamem_reg_write_data (.sel(MEMWB_Mem2Reg), .in({MEMWB_datamem_read_data, MEMWB_ALU_out}), .out(MEMWB_data_out)); // Output of either ALU or mem
	
	mux2to1 #(64) reg_write_val_mux (.sel(MEMWB_BL), .in({MEMWB_PC_p4, MEMWB_data_out}), .out(reg_write_data)); // for BL maybe MEMWB_PC_normal
	mux2to1 #(5) mux_BL_write_addr (.sel(BL), .in({5'd30, IFID_instruction[4:0]}), .out(instr_Rd));

	mux4to1 #(5) reg_read_addr2_mux (.sel({IDEX_is_BR, Reg2Loc}), .in({IDEX_Rd, IDEX_Rd, IFID_instruction[4:0], IFID_instruction[20:16]}), .out(reg_read_addr2)); // Reg2Loc output

//	mux4to1 #(64) mux_BL (.sel(BL_Rm_forward), .in({EXMEM_PC_normal, MEMWB_PC_normal, EXMEM_PC_normal, reg_read_data2}), .out(read_data1_out));
//	mux4to1 #(64) mux_BL (.sel(BL_forward), .in({EXMEM_PC_normal, MEMWB_PC_normal, EXMEM_PC_normal, reg_read_data2}), .out(read_data2_out));

endmodule // CPU_1cycle
