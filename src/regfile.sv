/*
    This module implements 32, 64-bit registers in accordance with the ARM instruction set.
    All components are described using structural HDL notation and composed of logical submodules.
    Accepts a clock, two 5-bit register addresses to read from and one register to write from. 
    Accepts 64-bit data to write to WriteRegister and a RegWrite signal which determines whether to write.
    Outputs the 64-bit data stored at ReadRegister1 and ReadRegister2 
*/

module regfile (ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, clk,
					 ReadData1, ReadData2);
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	
	// local signals
	logic [31:0] [63:0] DataOut;
	logic [30:0] enable_signals;
	logic [63:0] RegReadData1, RegReadData2;
	logic write_eq_reg1, write_eq_reg2, write_addr_eq_read_addr1, write_addr_eq_read_addr2, 
			read_addr1_neq_31, read_addr2_neq_31, read_addr1_eq_31, read_addr2_eq_31;
	genvar i;
		
	//  generate 32 64-bit registers
	generate
		 for (i = 0; i < 31; i=i+1) begin : generate_registers
			register_64 reg_64 (.clk(clk), .en(enable_signals[i]), .d(WriteData), .q(DataOut[i]));
//			mux2to1 #(64) multiplexor_read_write (.sel(WriteData), .in({WriteData, regOut
		end
	endgenerate
	
	// 31th register XZR is always 0 and cannot be written to.
	assign DataOut[31] = {64{1'b0}};
	
	// wire muxes to correctly assign ReadRegisters
	mux32to1 multiplexor_read_1 (.sel(ReadRegister1), .in(DataOut), .out(RegReadData1));
	mux32to1 multiplexor_read_2 (.sel(ReadRegister2), .in(DataOut), .out(RegReadData2));
//	mux32to1 multiplexor_read_1 (.sel(ReadRegister1), .in(DataOut), .out(ReadData1));
//	mux32to1 multiplexor_read_2 (.sel(ReadRegister2), .in(DataOut), .out(ReadData2));
	
	comparator_5 check_read_addr1_eq_31 (.A(ReadRegister1), .B(5'd31), .result(read_addr1_eq_31));
	comparator_5 check_read_addr2_eq_31 (.A(ReadRegister2), .B(5'd31), .result(read_addr2_eq_31));
	not (read_addr1_neq_31, read_addr1_eq_31);
	not (read_addr2_neq_31, read_addr2_eq_31);
	
	comparator_5 check_write_eq_reg1 (.A(WriteRegister), .B(ReadRegister1), .result(write_addr_eq_read_addr1));
	comparator_5 check_write_eq_reg2 (.A(WriteRegister), .B(ReadRegister2), .result(write_addr_eq_read_addr2));

	and (write_eq_reg1, RegWrite, write_addr_eq_read_addr1, read_addr1_neq_31);
	and (write_eq_reg2, RegWrite, write_addr_eq_read_addr2, read_addr2_neq_31);
	
	mux2to1 #(64) multiplexor_read_write_addr1 (.sel(write_eq_reg1), .in({WriteData, RegReadData1}), .out(ReadData1));
	mux2to1 #(64) multiplexor_read_write_addr2 (.sel(write_eq_reg2), .in({WriteData, RegReadData2}), .out(ReadData2));
	
    // wire demux to correctly write to WriteRegister
	decoder_5to32 demux (.select(WriteRegister), .write_en(RegWrite), .out(enable_signals));
	
endmodule // regfile
