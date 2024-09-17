/*
    Filename: branch_check.sv
    Authors: Adam Friesz, Brandon Chang
    Description: Takes in various control signals related to branching an outputs takeBranch which tells if a branch
    should be taken in the current clock cycle or not. 
*/
`include "macros.txt"
module branch_check (Uncondbranch, Branch, BLT, isZero, flag_neg, se_ctrl, IDEX_setFlags, alu_neg, takeBranch);
	input logic Uncondbranch, Branch, BLT, isZero, flag_neg, IDEX_setFlags, alu_neg;
	input logic [1:0] se_ctrl;
	output logic takeBranch;
	
	logic not_se_ctrl_0, validCBZ, validBLT, currFlags, forwardBLT;
	
	not `DELAY (not_se_ctrl_0, se_ctrl[0]);
	
	and `DELAY (validCBZ, isZero, Branch, se_ctrl[1], not_se_ctrl_0);
	
	and `DELAY (forwardBLT, BLT, IDEX_setFlags, alu_neg);
	and `DELAY (currFlags, flag_neg, BLT);
	
	mux2to1 #(1) mux_forward_flags (.sel(IDEX_setFlags), .in({forwardBLT, currFlags}), .out(validBLT));
	
	or `DELAY (takeBranch, Uncondbranch, validCBZ, validBLT);
endmodule // branch_check