// a 3-line input to 5-line output decoder
// select           - lowest three MSbs of WriteRegister
// decoder_selected - this decoder was selected using the top two MSbs of WriteRegister's address
// out              - the wires for enabling register

`include "macros.txt"
module decoder_3to8(input logic [2:0] select, input logic decoder_selected, output logic[7:0] out);

	// generate inverted select signals
	logic [2:0] not_select;
	not `DELAY (not_select[0], select[0]);
	not `DELAY (not_select[1], select[1]);
	not `DELAY (not_select[2], select[2]);

	// assign output values using common decoder circuit layout
	and `DELAY (out[0], not_select[2], not_select[1], not_select[0], decoder_selected);
	and `DELAY (out[1], not_select[2], not_select[1], select[0], decoder_selected);
	and `DELAY (out[2], not_select[2], select[1], not_select[0], decoder_selected);
	and `DELAY (out[3], not_select[2], select[1], select[0], decoder_selected);
	and `DELAY (out[4], select[2], not_select[1], not_select[0], decoder_selected);
	and `DELAY (out[5], select[2], not_select[1], select[0], decoder_selected);
	and `DELAY (out[6], select[2], select[1], not_select[0], decoder_selected);
	and `DELAY (out[7], select[2], select[1], select[0], decoder_selected);
    
endmodule //decoder_3to8