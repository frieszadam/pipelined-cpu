// Tests the 5to32 decoder / demux
`timescale 1 us / 1 us
module decoder_5to32_tb();

    // instantiate test variables
    logic [4:0] select;
    logic write_en;
    logic [31:0] out;
    
    // instantiate the test module
    decoder_5to32 dut (.*);
    
    // Run through all possible possibilities
    initial begin
        for (int i = 0; i < 64; i++) begin
            {write_en, select} <=i;
				#10;
        end
    end
    
endmodule //decoder_5to32_tb