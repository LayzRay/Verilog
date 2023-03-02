module bin2dec_2 (SW,HEX1,HEX0);

	input [3:0] SW;
	output reg[6:0] HEX1,HEX0;
	
	wire z;
	assign z = SW > 4'b1001;
	
	always @(*)
	begin
		if (z)
			case (SW)
			
				4'b1010: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1111_001; 
				end
				
				4'b1011:	begin 
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1111_001;	

				end
				4'b1100: begin	
				HEX0 <= 7'b0100_100; 
				HEX1 <= 7'b1111_001; 

				end
			   4'b1101: begin	
				HEX0 <= 7'b0110_000; 
				HEX1 <= 7'b1111_001; 
				
				end
				
				4'b1110: begin	
			   HEX0 <= 7'b0011_001; 
				HEX1 <= 7'b1111_001; 
			
				end
				4'b1111: begin	
				HEX0 <= 7'b0010_010; 
				HEX1 <= 7'b1111_001; 
				end
				
				default: 
				begin
				HEX0 <= 7'b1000_000;
				HEX1 <= 7'b1000_000;
				end
			
			endcase
		else
			case (SW)
			
				4'b0000: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1000_000; 
				end
				4'b0001:	begin 
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1000_000;	

				end
				4'b0010: begin	
				HEX0 <= 7'b0100_100; 
				HEX1 <= 7'b1000_000; 

				end
			   4'b0011: begin	
				HEX0 <= 7'b0110_000; 
				HEX1 <= 7'b1000_000; 
				
				end
				
				4'b0100: begin	
			   HEX0 <= 7'b0011_001; 
				HEX1 <= 7'b1000_000; 
			
				end
				4'b0101: begin	
				HEX0 <= 7'b0010_010; 
				HEX1 <= 7'b1000_000; 
				
				end
				4'b0110: begin	
				HEX0 <= 7'b0000_010; 
				HEX1 <= 7'b1000_000; 
		
				end
				4'b0111: begin	
				HEX0 <= 7'b1111_000; 
				HEX1 <= 7'b1000_000; 
				
				end
				4'b1000: begin	
				HEX0 <= 7'b0000_000; 
				HEX1 <= 7'b1000_000; 

				end
				
				4'b1001: begin	
				HEX0 <= 7'b0010_000; 
				HEX1 <= 7'b1000_000; 
				end
				
				default: 
				begin
				HEX0 <= 7'b1000_000;
				HEX1 <= 7'b1000_000;
				end
			
			endcase
		
	end
	
endmodule