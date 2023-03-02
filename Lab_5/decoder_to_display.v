//Опишем дешифратор для вывода на индикаторы. За основу возьмём дешифратор из 2-ой лабораторной.

module decoder_to_display (SW, HEX);

	input [3:0] SW;
	output reg [6:0] HEX;
	
	always @(SW) begin
	
		case(SW[3:0])	
		
				4'b0000: HEX = 7'b1000_000;
				4'b0001:	HEX = 7'b1111_001;
				4'b0010:	HEX = 7'b0100_100;
				4'b0011:	HEX = 7'b0110_000;
				4'b0100:	HEX = 7'b0011_001;
				4'b0101:	HEX = 7'b0010_010;
				4'b0110: HEX = 7'b0000_010;
				4'b0111:	HEX = 7'b1111_000;
				4'b1000:	HEX = 7'b0000_000;
				4'b1001:	HEX = 7'b0010_000;
				
				4'b1110:	HEX = 7'b0000_110; //E
				4'b1111:	HEX = 7'b0101_111; //r
					
				default: HEX = 7'b1111_111;
				
			endcase
	
	end
	
endmodule


