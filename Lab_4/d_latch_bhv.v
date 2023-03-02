module d_latch_bhv (d, en, q);

	input d, en;
	output reg q;
	
	always @(en,d) begin
	
		if (en) q <= d;
		else 	  q <= q;
		
	end
	
endmodule