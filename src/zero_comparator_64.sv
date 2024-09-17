
`include "macros.txt"
module zero_comparator_64 (A, isZero);
    input logic [63:0] A;
    output logic isZero;
	 
    logic [15:0] zero_16;
    logic [3:0] zero_4;
    logic not_zero;
    
    // Generate block to check for zero in 4-bit chunks
    genvar i;
    generate
        for (i = 0; i < 16; i=i+1) begin : gen_16
            or `DELAY (zero_16[i], A[4*i], A[4*i+1], A[4*i+2], A[4*i+3]);
        end
    endgenerate

    // Generate block to combine the results of zero_16
    generate
        for (i = 0; i < 4; i=i+1) begin : gen_4
            or `DELAY (zero_4[i], zero_16[4*i], zero_16[4*i+1], zero_16[4*i+2], zero_16[4*i+3]);
        end
    endgenerate

    // Combine the results of zero_4 to determine if A is zero
    or `DELAY (not_zero, zero_4[0], zero_4[1], zero_4[2], zero_4[3]);
    not `DELAY (isZero, not_zero);

endmodule

