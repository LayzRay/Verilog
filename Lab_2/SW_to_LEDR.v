module SW_to_LEDR (SW,LEDR);

	input [9:0] SW;
	output [9:0] LEDR;
	
	assign LEDR = SW;

endmodule