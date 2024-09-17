/*
	Filename: forwarding_unit.sv
	Authors: Adam Friesz, Brandon Chang
	Description: Decects write-use data hazards and performs forwarding to resolve these hazards
	without the use of stalling.
*/
module fowarding_unit (IDEX_MemWrite, MEMWB_RegWrite, EXMEM_RegWrite, MEMWB_Rd, EXMEM_Rd, IDEX_Rn,
							 IDEX_Rm, IDEX_Rd, ForwardA, ForwardB);
	input logic MEMWB_RegWrite, EXMEM_RegWrite, IDEX_MemWrite;
	input logic [4:0] MEMWB_Rd, EXMEM_Rd, IDEX_Rn, IDEX_Rm, IDEX_Rd;
	output logic [1:0] ForwardA, ForwardB;
	
	logic valid_EXMEM_Rd, valid_MEMWB_Rd, EXMEM_is_31_4, MEMWB_is_31_4, EXMEM_is_31, MEMWB_is_31;
	logic MEMWB_Rd_eq_Rn, MEMWB_Rd_eq_Rm, EXMEM_Rd_eq_Rn, EXMEM_Rd_eq_Rm, EXMEM_Rd_eq_Rd, MEMWB_Rd_eq_Rd;
	logic ForwardB_RI_EXMEM, ForwardB_RI_MEMWB, ForwardB_STUR_EXMEM, ForwardB_STUR_MEMWB, not_EXMEM_A, not_EXMEM_B;
	
	// check if Rd is 31
	and(EXMEM_is_31_4, EXMEM_Rd[0], EXMEM_Rd[1], EXMEM_Rd[2], EXMEM_Rd[3]);
	and(EXMEM_is_31, EXMEM_is_31_4, EXMEM_Rd[4]);
	not (valid_EXMEM_Rd, EXMEM_is_31);
	
	// check if Rd is 31
	and(MEMWB_is_31_4, MEMWB_Rd[0], MEMWB_Rd[1], MEMWB_Rd[2], MEMWB_Rd[3]);
	and(MEMWB_is_31, MEMWB_is_31_4, MEMWB_Rd[4]);
	not (valid_MEMWB_Rd, MEMWB_is_31);
	
	// Rd == Rn
	comparator_5 check_EXMEM_Rd_eq_Rn (EXMEM_Rd, IDEX_Rn, EXMEM_Rd_eq_Rn);
	comparator_5 check_EXMEM_Rd_eq_Rm (EXMEM_Rd, IDEX_Rm, EXMEM_Rd_eq_Rm);
	comparator_5 check_MEMWB_Rd_eq_Rn (MEMWB_Rd, IDEX_Rn, MEMWB_Rd_eq_Rn);
	comparator_5 check_MEMWB_Rd_eq_Rm (MEMWB_Rd, IDEX_Rm, MEMWB_Rd_eq_Rm);
	comparator_5 check_EXMEM_Rd_eq_Rd (EXMEM_Rd, IDEX_Rd, EXMEM_Rd_eq_Rd);
	comparator_5 check_MEMWB_Rd_eq_Rd (MEMWB_Rd, IDEX_Rd, MEMWB_Rd_eq_Rd);

	// 1.a, 2.a
	always_comb begin
		if (EXMEM_RegWrite & valid_EXMEM_Rd & (EXMEM_Rd_eq_Rn))
			ForwardA = 2'b10;
		else if (MEMWB_RegWrite & valid_MEMWB_Rd & (MEMWB_Rd_eq_Rn))
			ForwardA = 2'b01;
		else
			ForwardA = 2'b00;
			
		// 1.b, 2.b 
		// Checks Rd to account for STUR forwarding Rd since Reg2Loc sends [4:0] to ALU_b
		if ((EXMEM_RegWrite & valid_EXMEM_Rd & (EXMEM_Rd_eq_Rm)) | (EXMEM_Rd_eq_Rd & EXMEM_RegWrite & IDEX_MemWrite))
			ForwardB = 2'b10;
		else if ((MEMWB_RegWrite & valid_MEMWB_Rd & (MEMWB_Rd_eq_Rm)) | (MEMWB_Rd_eq_Rd & MEMWB_RegWrite & IDEX_MemWrite))
			ForwardB = 2'b01;
		else
			ForwardB = 2'b00;
	end // always_comb


endmodule // forwarding_unit

// Attempted gate logic
//	// 1.a
//	and (ForwardA[1], EXMEM_RegWrite, valid_EXMEM_Rd, EXMEM_Rd_eq_Rn);
//	
//	// 2.a
////	not (not_EXMEM_A, ForwardA[1]);
////	and (ForwardA[0], MEMWB_RegWrite, valid_MEMWB_Rd, MEMWB_Rd_eq_Rn, not_EXMEM_A);
//	and (ForwardA[0], MEMWB_RegWrite, valid_MEMWB_Rd, MEMWB_Rd_eq_Rn);
//
//	// 1.b 
//	and(ForwardB_RI_EXMEM, EXMEM_RegWrite, valid_EXMEM_Rd, EXMEM_Rd_eq_Rm);
//	and(ForwardB_STUR_EXMEM, EXMEM_Rd_eq_Rd, EXMEM_RegWrite, IDEX_MemWrite);
//	or(ForwardB[1], ForwardB_RI_EXMEM, ForwardB_STUR_EXMEM);
//	
//	// 2.b
////	not(not_EXMEM_B, ForwardB[1]);
//	and(ForwardB_RI_MEMWB, MEMWB_RegWrite, valid_MEMWB_Rd, MEMWB_Rd_eq_Rm);
//	and(ForwardB_STUR_MEMWB, MEMWB_Rd_eq_Rd, MEMWB_RegWrite, IDEX_MemWrite);
////	or(ForwardB[0], ForwardB_RI_MEMWB, ForwardB_STUR_MEMWB, not_EXMEM_B);
//	or(ForwardB[0], ForwardB_RI_MEMWB, ForwardB_STUR_MEMWB);
