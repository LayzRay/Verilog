module bin2dec_4 (SW, LEDG, HEX3, HEX2,HEX1,HEX0);

	input [9:0] SW;
	output reg [7:0] LEDG;
	output reg [6:0] HEX3,HEX2,HEX1,HEX0;
	
	reg [7:0] hundred;
	reg [6:0] ten;
	
	
	always @(*) begin
	
		case(SW[9:8])
			
			2'b00 :
			begin
	
			hundred <= 8'd0;
			HEX3 <= 7'b1111_111;
			HEX2 <= 7'b1111_111;
			//HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			2'b01 :
			begin
	
			hundred <= 8'd100;
			HEX3 <= 7'b1111_111;
			HEX2 <= 7'b1111_111;
			//HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			2'b10 : begin
			
			hundred <= 8'd200;
			
			HEX3 <= 7'b1111_111;
			HEX2 <= 7'b1111_111;
			//HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			2'b11 : 
			
			begin
			
			HEX3 <= 7'b1111_111;
			HEX2 <= 7'b0000_110;
			HEX1 <= 7'b0101_111;
			HEX0 <= 7'b0101_111;
			
			end
		
		endcase
		
		case(SW[7:4])
		
		
			4'b0000 : begin
			
			ten <= 7'd0;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0001 : begin 
			
			ten <= 7'd10;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0010 : begin
			
			ten <= 7'd20;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0011 : begin
			
			ten <= 7'd30;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0100 : begin
			
			ten <= 7'd40;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0101 : begin
			
			ten <= 7'd50;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0110 : begin
			
			ten <= 7'd60;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b0111 : begin 
			
			ten <= 7'd70;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b1000 : begin
			
			ten <= 7'd80;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			4'b1001 : begin
			
			ten <= 7'd90;
			HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b1111_111;
			HEX1 <= 7'b1111_111;
			//HEX0 <= 7'b1111_111;
			
			end
			
			//default: begin
			
			//HEX3 <= 7'b1111_111;
			//HEX2 <= 7'b0000_110;
			//HEX1 <= 7'b0101_111;
			//HEX0 <= 7'b0101_111;
			
			//end
		
		endcase
		
		if ((hundred + ten + SW[3:0] <= 8'd255) && (SW[3:0] <= 4'd9)) begin
		
		LEDG[0] <= SW[0]; 
		LEDG[7:1] <= hundred[7:1] + ten[6:1] + SW[3:1];
		
		end
		else begin
		
		LEDG <= 8'd255;
		HEX3 <= 7'b1111_111;
		HEX2 <= 7'b0000_110;
		HEX1 <= 7'b0101_111;
		HEX0 <= 7'b0101_111;
		
		end
	
	end
	
endmodule