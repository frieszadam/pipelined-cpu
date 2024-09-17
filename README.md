# Pipelined ARM CPU

This design originated in collaboration with Brandon Chang during Computer Architecture EE469. I have optimized and extended the original design to include almost the entire LEGv8 instruction set while adhering to industry standard code quality guidelines for improved clarity. Centered around the approach discussed in Computer Organization and Design by Patterson and Hennessy, instruction processing is divided into 5 stages separated by pipeline registers: fetch, decode, execute, memory access, write-back.

The project’s requirements specified the design must be completed in SystemVerilog using entirely structural specification with the exception of the control unit. While I was initially skeptical of this methodology, I gained a deep understanding of the architecture by constructing the design gate by gate. From the forwarding and branch prediction units to the ALU's carry-lookahead adder, I have developed an intimate knowledge of the CPU’s inner workings.
