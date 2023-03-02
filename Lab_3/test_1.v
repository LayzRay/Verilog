module test_1(SW,HEX0,HEX1, HEX2);

	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
 
	//wire [3:0] bin0, bin1, bin2;

	
	
	decoder_to_display dtd_1 (.SW(SW[3:0]),.HEX(HEX0));
	decoder_to_display dtd_2 (.SW(SW[7:4]),.HEX(HEX1));
	decoder_to_display dtd_3 (.SW({2'b00,SW[9:8]}),.HEX(HEX2));
	

endmodule