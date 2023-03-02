module register_bhv (d, clk, rst, en, q);

	input [7:0] d;
	input clk, rst, en;
	output reg [7:0] q;
	
	initial q <= 8'b0;
	
	always @(posedge clk or posedge rst) begin
		if (rst) q <= 7'b0;
		else begin
			if (en) q <= d;
			else q <= q;
		end
	end

endmodule	