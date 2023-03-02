module lab_3 (SW,LEDG);

	input [7:0] SW;
	output reg[4:0] LEDG;
	
	always @(*)
	begin
			case (SW)
			
				8'b0000_0000: begin	
				LEDG = 5'b00000;
				end
				
				8'b0000_0001: begin	
				LEDG = 5'b00001;
				end	

				8'b0000_0010: begin	
				LEDG = 5'b00010;
				end

			   8'b0000_0011: begin	
				LEDG = 5'b00011;
				end 
				
				
				8'b0000_0100: begin	
				LEDG = 5'b00100;
				end 
			
				8'b0000_0101: begin	
				LEDG = 5'b00101;
				end 
				
				8'b0000_0110: begin	
				LEDG = 5'b00110;
				end
				
				8'b0000_0111: begin	
				LEDG = 5'b00111;
				end
				
				8'b0000_1000: begin	
				LEDG = 5'b01000;
				end
				
				8'b0000_1001: begin	
				LEDG = 5'b01001;
				end
				
				8'b0001_0000: begin	
				LEDG = 5'b01010;
				end
				
				8'b0001_0001: begin	
				LEDG = 5'b01011;
				end
				
				8'b0001_0010: begin	
				LEDG = 5'b01100;
				end
				
				8'b0001_0011: begin	
				LEDG = 5'b01101;
				end
				
				8'b0001_0100: begin	
				LEDG = 5'b01110;
				end
				
				8'b0001_0101: begin	
				LEDG = 5'b01111;
				end
				
				8'b0001_0110: begin	
				LEDG = 5'b10000;
				end
				
				8'b0001_0111: begin	
				LEDG = 5'b10001;
				end
				
				8'b0001_1000: begin	
				LEDG = 5'b10010;
				end
				
				8'b0001_1001: begin	
				LEDG = 5'b10011;
				end
				
				default: 
				begin
				LEDG = 5'b111111;
				end
			
			endcase
			
	end
	
endmodule