// a 5-line input to 32-line output decoder
// select   - WriteRegister
// write_en - An asserted signal that asks for WriteRegister to be changed
// out      - the wires for enabling register writing

`include "macros.txt"
module decoder_5to32(input logic [4:0] select, input logic write_en, output logic [31:0] out);

    // instante basic wires
    logic [3:0] selected;
    logic [31:0] out_sig;
    
    // decode the 2 MSbs to determine the input signal for each of the 3:8 demuxes
    logic [4:3] not_select;
    not `DELAY (not_select[3], select[3]);
    not `DELAY (not_select[4], select[4]);
    and `DELAY (selected[0], not_select[4], not_select[3], write_en);
    and `DELAY (selected[1], not_select[4], select[3], write_en);
    and `DELAY (selected[2], select[4], not_select[3], write_en);
    and `DELAY (selected[3], select[4], select[3], write_en);
    
    // Decoder instantiation
    decoder_3to8 decode0 (.select(select[2:0]), .decoder_selected(selected[0]), .out(out[7:0]));
    decoder_3to8 decode1 (.select(select[2:0]), .decoder_selected(selected[1]), .out(out[15:8]));
    decoder_3to8 decode2 (.select(select[2:0]), .decoder_selected(selected[2]), .out(out[23:16]));
    decoder_3to8 decode3 (.select(select[2:0]), .decoder_selected(selected[3]), .out(out[31:24]));
    
endmodule // decoder_5to32