module bin2dec_3 (SW, LEDG, HEX0, HEX1, HEX2);

	input [7:0] SW;
	output reg [7:0] LEDG;
	output reg [6:0] HEX0, HEX1, HEX2;
	
	reg [6:0] ten;
	
	
	always @(*) begin
		
	
		case(SW[7:4])
			
			4'b0000 : begin
			
			ten <= 7'd0;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0001 : begin 
			
			ten <= 7'd10;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0010 : begin
			
			ten <= 7'd20;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0011 : begin
			
			ten <= 7'd30;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0100 : begin
			
			ten <= 7'd40;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0101 : begin
			
			ten <= 7'd50;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0110 : begin
			
			ten <= 7'd60;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b0111 : begin 
			
			ten <= 7'd70;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b1000 : begin
			
			ten <= 7'd80;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			4'b1001 : begin
			
			ten <= 7'd90;
			HEX2 <= 7'b0000_000;
			HEX1 <= 7'b0000_000;
			HEX0 <= 7'b0000_000;
			
			end
			
			default: begin
	
			ten <= 7'd0;
			HEX2 <= 7'b0000_110;
			HEX1 <= 7'b0101_111;
			HEX0 <= 7'b0101_111;
			
			end
		
		endcase
		
		if ((HEX0 == 7'b0101_111) || (SW[3:0] > 4'd9)) begin
		
			LEDG <= 7'b0;
			HEX2 <= 7'b0000_110;
			HEX1 <= 7'b0101_111;
			HEX0 <= 7'b0101_111;
			
			end
		else begin
		
		LEDG[0] <= SW[0];
		LEDG[6:1] <= ten[6:1] + SW[3:1];
		
		end
	
	end
	
endmodule