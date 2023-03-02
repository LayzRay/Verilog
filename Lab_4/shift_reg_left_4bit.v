module shift_reg_left_4bit(clk, en, ISL, rst, OSL, shift_rg);

	input clk, en, ISL, rst;
	output reg OSL;
	output reg [3:0] shift_rg;
	
	initial shift_rg = 4'b0;
	
	always @(posedge clk) begin
	
		if (rst) begin
			
			shift_rg <= 4'b0;
			OSL <= 1'b0;
			
		end else begin
			
			if (en) begin
				shift_rg <= {shift_rg[2:0],ISL};
				OSL <= shift_rg[3];
			end
		end
	end

endmodule