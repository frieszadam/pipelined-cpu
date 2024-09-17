/*
	Filename: cpu_ctrl.sv
	Authors: Adam Friesz, Brandon Chang
	Date: July 18th, 2024
	Description: This module is the controller for a single-cycle cpu. Signals are generated based
	on the instruction opcode, defined by the 11 most significant bits. Control signals are used
	as selector bits to various muxes used to stitch together the datapath elements.

	Inputs:
		instr_MSB: 11 most significant bits of instruction (the instruction opcode)
	
	Outputs:	
		Reg2Loc: send instr[4:0] to reg_read_addr2 (1) or instr[20:16] (0)
		Branch: is this a branch instruction?
		Mem2Reg: send datamem output to reg_write_data? 
		ALUop: input for alu determining whether to add, sub, passb, etc. 
		MemWrite: are we writing to memory?
		ALUSrc: set se_data_extended as B input to ALU (1) or reg_read_data2
		RegWrite: are we writing to the regfile
		Uncondbranch: are we executing an unconditional branch?
		setFlags: should we update the flag register?
		se_ctrl: input to sign extender to determine which bit to extend from.
		BLT: are we executing branch less than instr?
		BL: are we executing branch register instr?
*/
`include "macros.txt"

module cpu_ctrl (instr_MSB, Reg2Loc, Branch, Mem2Reg, ALUop, MemWrite, ALUSrc, RegWrite, Uncondbranch, //reset,
				 setFlags, se_ctrl, BLT, BL, LDUR);
	input logic [10:0] instr_MSB;
	output logic Reg2Loc, Branch, Mem2Reg, MemWrite, ALUSrc, RegWrite, Uncondbranch, setFlags, BLT, BL, LDUR;
	output logic [1:0] se_ctrl;
	output logic [2:0] ALUop;
//	input logic reset;
	// combinatorial logic to determine control signals
	/*
	always_comb begin
		if (reset) begin
		end
	end  // always_comb
	*/
	always_comb begin
		casex (instr_MSB)
			default: begin
				Reg2Loc = 0;
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `PASSB;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 0;
				se_ctrl = `I;  // x
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b100_1000_100x: begin  // ADDI
				Reg2Loc = 0; // x
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `ADD;
				MemWrite = 0;			
				ALUSrc = 1;
				RegWrite = 1;
				se_ctrl = `I;
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b101_0101_1000: begin  // ADDS
				Reg2Loc = 0;
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `ADD;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 1;
				se_ctrl = `I;  // x
				Uncondbranch = 0;
				setFlags = 1;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b000_101x_xxxx: begin  // B
				Reg2Loc = 0;
				Branch = 1;
				Mem2Reg = 0;
				ALUop = `PASSB;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 0;
				se_ctrl = `B;
				Uncondbranch = 1;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b010_1010_0xxx: begin  // B.cond (B.LT)
				Reg2Loc = 0;
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `PASSB;  // x
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 0;
				se_ctrl = `CB;
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 1;
				BL = 0;
				LDUR = 0;
			end
			11'b100_101x_xxxx: begin  // BL
				Reg2Loc = 0;  // x
				Branch = 1;
				Mem2Reg = 0;
				ALUop = `PASSB;
				MemWrite = 0;			
				ALUSrc = 1;
				RegWrite = 1;
				se_ctrl = `B;
				Uncondbranch = 1;
				setFlags = 0;
				BLT = 0;
				BL = 1;
				LDUR = 0;
			end
			11'b110_1011_0000: begin  // BR 0x6B0
				Reg2Loc = 1;
				Branch = 1;
				Mem2Reg = 0;
				ALUop = `PASSB;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 0;
				se_ctrl = `I;  // x
				Uncondbranch = 1;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b101_1010_0xxx: begin  // CBZ 0x5A0-5A7
				Reg2Loc = 1;
				Branch = 1;
				Mem2Reg = 0;
				ALUop = `PASSB;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 0;
				se_ctrl = `CB;
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b111_1100_0010: begin  // LDUR
				Reg2Loc = 0;
				Branch = 0;
				Mem2Reg = 1;
				ALUop = `ADD;
				MemWrite = 0;			
				ALUSrc = 1;
				RegWrite = 1;
				se_ctrl = `D;
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 1;
			end
			11'b111_1100_0000: begin  // STUR
				Reg2Loc = 1;
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `ADD;
				MemWrite = 1;			
				ALUSrc = 1;
				RegWrite = 0;
				se_ctrl = `D;
				Uncondbranch = 0;
				setFlags = 0;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
			11'b111_0101_1000: begin  // SUBS
				Reg2Loc = 0;
				Branch = 0;
				Mem2Reg = 0;
				ALUop = `SUB;
				MemWrite = 0;			
				ALUSrc = 0;
				RegWrite = 1;
				se_ctrl = `I;  // x
				Uncondbranch = 0;
				setFlags = 1;
				BLT = 0;
				BL = 0;
				LDUR = 0;
			end
//			default: begin
//				Reg2Loc = 0;
//				Branch = 0;
//				Mem2Reg = 0;
//				ALUop = `PASSB;
//				MemWrite = 0;			
//				ALUSrc = 0;
//				RegWrite = 0;
//				se_ctrl = `I;  // x
//				Uncondbranch = 0;
//				setFlags = 0;
//				BLT = 0;
//				BL = 0;
//				LDUR = 0;
//			end
		endcase
	end  // always_comb
endmodule  // cpu_ctrl