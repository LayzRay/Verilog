module counter_8bit(clk, en, rst, counter);

	input clk, en, rst;
	output reg [7:0] counter;
	
	initial counter = 8'b0;
	
	always @(posedge clk or posedge rst) begin
		if(rst) counter <= 0;
		else begin
			if (en) counter <= counter + 1;
			else counter <= counter;
			
		end
	end

endmodule