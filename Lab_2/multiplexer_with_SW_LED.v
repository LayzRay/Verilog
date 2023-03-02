module multiplexer_with_SW_LED (SW,LEDR,LEDG);

	input [9:0] SW;
	output [9:0] LEDG, LEDR;
	
	assign LEDG [7:4] = ({4{~SW[8]}} & SW[3:0])| ({4{SW[8]}} & SW[7:4]);
	assign LEDR [8:0] = SW [8:0];
	
endmodule