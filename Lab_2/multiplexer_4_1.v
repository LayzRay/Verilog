module multiplexer_4_1 (x,y,s,m);

	input [3:0] x,y;
	input s;
	output reg [3:0] m;
	
	always @(*)
		begin
		if (s)
			m = y;
		else
			m = x;
		end
	
endmodule