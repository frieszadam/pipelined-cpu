/*
    Filename: CBZ_forwarder
    Authors: Adam Friesz, Brandon Chang
    Description: Generates control signal to tell which data to check as part of CBZ instruction.
    forward_CBZ: bit 0 = forward IDEX   bit 1 = forward EXMEM   if both bits are high forward IDEX
*/

`include "macros.txt"
module CBZ_forwarder (instr_Rd, IDEX_Rd, EXMEM_Rd, IDEX_RegWrite, EXMEM_RegWrite, forward_CBZ);
	input logic [4:0] instr_Rd, IDEX_Rd, EXMEM_Rd;
	input logic IDEX_RegWrite, EXMEM_RegWrite;
	output logic [1:0] forward_CBZ;
	
	logic IDEX_is_eq, EXMEM_is_eq;
	
	comparator_5 IFID_eq_IDEX (.A(instr_Rd), .B(IDEX_Rd), .result(IDEX_is_eq));
	comparator_5 IFID_eq_EXMEM (.A(instr_Rd), .B(EXMEM_Rd), .result(EXMEM_is_eq));

	and `DELAY (forward_CBZ[1], IDEX_is_eq, IDEX_RegWrite);
	and `DELAY (forward_CBZ[0], EXMEM_is_eq, EXMEM_RegWrite);	
	
endmodule // CBZ_forwarder
