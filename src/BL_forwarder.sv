/*
    Filename: BL_forwarder.sv
    Authors: Adam Friesz, Brandon Chang
    Description: This unit is generates ctrl signals that tells whether and what to forward FROM BL (PC_p4).
    0b00: do not forward      0b01: forward MEMWB_PC_p4     0b10: forward EXMEM_PC_p4  	0b11: forward EXMEM_PC_p4
    BL_ForwardA should determine ALU_a input, BL_ForwardB should determine ALU_b input and BL_Forward_Rd should
    determine Rd (used for STUR and BR).
*/

`include "macros.txt"
module BL_forwarder (IDEX_Rn, IDEX_Rm, IDEX_Rd, IDEX_MemWrite, EXMEM_BL, MEMWB_BL, BL_ForwardA, BL_ForwardB, BL_Forward_Rd);
	input logic EXMEM_BL, MEMWB_BL, IDEX_MemWrite;
	input logic [4:0] IDEX_Rn, IDEX_Rm, IDEX_Rd;
	output logic [1:0] BL_ForwardA, BL_ForwardB, BL_Forward_Rd;
	
	logic Rn_is_thirty, Rm_is_thirty, RI_BL_EXMEM_forwardA, RI_BL_EXMEM_forwardB, Rd_is_thirty,
			RI_BL_MEMWB_forwardA, RI_BL_MEMWB_forwardB, STUR_LDUR_BL_Rd_forward, STUR_BL_EXMEM_forwardA,
			STUR_BL_EXMEM_forwardB, STUR_BL_MEMWB_forwardA, STUR_BL_MEMWB_forwardB;
	
	comparator_5 check_exmem_Rn_eq_idex (.A(IDEX_Rn), .B(5'd30), .result(Rn_is_thirty));
	comparator_5 check_exmem_Rm_eq_idex (.A(IDEX_Rm), .B(5'd30), .result(Rm_is_thirty));
	comparator_5 check_exmem_Rd_eq_idex (.A(IDEX_Rd), .B(5'd30), .result(Rd_is_thirty));
	
	and `DELAY (BL_ForwardA[1], Rn_is_thirty, EXMEM_BL);
	and `DELAY (BL_ForwardA[0], Rn_is_thirty, MEMWB_BL);

	and `DELAY (BL_ForwardB[1], Rm_is_thirty, EXMEM_BL);
	and `DELAY (BL_ForwardB[0], Rm_is_thirty, MEMWB_BL);
	
	and `DELAY (BL_Forward_Rd[1], Rd_is_thirty, IDEX_MemWrite, EXMEM_BL);
	and `DELAY (BL_Forward_Rd[0], Rd_is_thirty, IDEX_MemWrite, MEMWB_BL);


endmodule // BL_forwarder
