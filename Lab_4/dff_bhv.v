module dff_bhv(d, clk, set, rst, en, q);

	input d, clk, set, rst, en;
	output reg q;
	
	always @(posedge clk or posedge set or posedge rst)
	begin
		if (set) q <= 1'b1;
		else begin
			if (rst) q<= 1'b0;
			else begin
				if (en) q <= d;
				else    q <= q;
			end
		end
	end
	
	
endmodule