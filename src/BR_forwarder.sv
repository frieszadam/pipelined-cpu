/*
    Filename: BR_forwarder
    Authors: Adam Friesz, Brandon Chang
    Description: Forwards signals to BR instruction which is unique because forward comparison always
    occurs against and 30 and the forwarding check must occur in the instruction decode stage. 
*/

`include "macros.txt"
module BR_forwarder (instr_Rd, IDEX_Rd, EXMEM_Rd, IDEX_RegWrite, EXMEM_RegWrite, BR_Forward);
								
	input logic [4:0] instr_Rd, IDEX_Rd, EXMEM_Rd;
	input logic IDEX_RegWrite, EXMEM_RegWrite;
	output logic [1:0] BR_Forward;  // bit 0 = IDEX  	bit 1 = EXMEM
	
	logic instr_eq_exmem, instr_eq_idex;
	
	comparator_5 check_idex_eq_idex (.A(instr_Rd), .B(IDEX_Rd), .result(instr_eq_idex));
	comparator_5 check_exmem_eq_idex (.A(instr_Rd), .B(EXMEM_Rd), .result(instr_eq_exmem));

	and `DELAY (BR_Forward[0], instr_eq_idex, IDEX_RegWrite);
	and `DELAY (BR_Forward[1], instr_eq_exmem, EXMEM_RegWrite);

endmodule // BR_forwarder
