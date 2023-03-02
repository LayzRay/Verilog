module hundred (SW, hundred)

   input [1:0] SW;
	output reg [7:0] hundred;
	
	always @(SW) begin
	
		case(SW)
			
				2'b00 : hundred <= 8'd0;
				2'b01 : hundred <= 8'd100;
				2'b10 : hundred <= 8'd200;	
			
		endcase
		
	end

endmodule