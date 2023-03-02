module Seven_segment_display_4 (

	input [3:0] KEY,
	input [9:0] SW,
	output reg [6:0] HEX0,HEX1,HEX2,HEX3);
	
	always @(*)
	begin
		
		if (SW[9]) 
		begin
		
			HEX0 <= 7'b0001_100;
			HEX1 <= 7'b0100_001;
			HEX2 <= 7'b0001_001;
			HEX3 <= 7'b0001_000;
			
		end
		else 
		begin
			case (KEY)
			
				4'b1110: begin	
				HEX0 <= 7'b0001_100; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000;
				end
				4'b1101:	begin 
				HEX1 <= 7'b0100_001; 
				HEX0 <= 7'b1000_000;	
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000; 
				end
				4'b1011:	begin 
				HEX2 <= 7'b0001_001; 
				HEX1 <= 7'b1000_000; 
				HEX0 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000; 
				end
				4'b0111: begin 
				HEX3 <= 7'b0001_000;	
				HEX1 <= 7'b1000_000; 
				HEX0 <= 7'b1000_000; 
				HEX2 <= 7'b1000_000; 
				end
				
				default: 
				begin
				HEX0 <= 7'b1000_000;
				HEX1 <= 7'b1000_000;
				HEX2 <= 7'b1000_000;
				HEX3 <= 7'b1000_000;
				end
			
			endcase
		end
	end
	
endmodule