// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant

module alustim();

    // initialize local delay
	parameter delay = 100000;

    // instantiate inputs and outputs
	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

    // human-readable ALU control signals
	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	
    // instantiate test module
	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i;
	initial begin
	
		// Pass_B testing
		$display("%t testing PASS_B operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end
		
		// Additive testing
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			 if ((result != (A + B) && overflow != 1'b1) || negative != result[63] || zero != ((A + B) == 0)) begin
				$display("error adding %d and %d", A, B);
			end
		end
		A <= 0; B <= 0; #(delay); // Test adding zeroes together
		 if ((result != (A + B) && overflow != 1'b1) || negative != result[63] || zero != ((A + B) == 0)) begin
			$display("Error adding zeroes together");
		end
		
		// Subtractive testing
		$display("%t testing subtraction", $time);
		cntrl = ALU_SUBTRACT;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random(); #(delay);
			 if ((result != (A - B) && overflow != 1'b1) || negative != result[63] || zero != ((A + B) == 0)) begin
				$display("error subtracting %d and %d", A, B);
			end
		end
		A <= 0; B <= 0; #(delay); // Test adding zeroes together
		 if ((result != (A + B) && overflow != 1'b1) || negative != result[63] || zero != ((A + B) == 0)) begin
			$display("Error subtracting zeroes together");
		end
		
		// AND testing
		$display("%t testing AND operation", $time);
		cntrl = ALU_AND;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random(); #(delay);
			if (result != (A & B)) begin
				$display("Error ANDing A and B, %b compared to %b", result, A & B);
			end
		end
		
		// OR testing
		$display("%t testing OR operation", $time);
		cntrl = ALU_OR;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random(); #(delay);
			if (result != (A | B)) begin
				$display("Error ORing A and B, %d compared to %d", result, A | B);
			end
		end
		
		// XOR testing
		$display("%t testing XOR operation", $time);
		cntrl = ALU_XOR;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random(); #(delay);
			if (result != (A ^ B)) begin
				$display("Error XORing A and B, %d compared to %d", result, A ^ B);
			end
		end
	end
endmodule // alustim
