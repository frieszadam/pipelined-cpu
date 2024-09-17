# Pipelined ARM CPU

This design originated in collaboration with Brandon Chang during Computer Architecture EE469. I have optimized and extended the original design to include almost the entire LEGv8 instruction set while adhering to industry standard code quality guidelines for improved clarity. Centered around the approach discussed in Computer Organization and Design by Patterson and Hennessy, instruction processing is split into 5 stages separated by registers: fetch, decode, execute, memory access, write-back.

Class criteria specified the design must be completed in SystemVerilog using entirely structural specification with the exception of the control unit. While I was initially skeptical of this approach, I gained an in-depth understanding by building up the design gate by gate. From the forwarding and branch prediciton unit to the ALU's carry-lookahead adder, I know the workings of this CPU inside and out. 

