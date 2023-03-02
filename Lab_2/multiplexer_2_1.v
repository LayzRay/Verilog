module multiplexer_2_1 (x,y,s,m);

	input x,y,s;
	output reg m;
	
	always @(*)
		begin
		if (s)
			m = y;
		else
			m = x;
		end

endmodule