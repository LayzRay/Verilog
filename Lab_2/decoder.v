module decoder (SW, HEX0);

	input [9:0] SW;
	output reg [6:0] HEX0;
	
	always @(*) begin
	
	case (SW[3:0])
		
		4'b0000: HEX0 = 7'b1000_000;
		4'b0001:	HEX0 = 7'b1111_001;
		4'b0010:	HEX0 = 7'b0100_100;
		4'b0011:	HEX0 = 7'b0110_000;
		4'b0100:	HEX0 = 7'b0011_001;
		4'b0101:	HEX0 = 7'b0010_010;
		4'b0110: HEX0 = 7'b0000_010;
		4'b0111:	HEX0 = 7'b1111_000;
		4'b1000:	HEX0 = 7'b0000_000;
		4'b1001:	HEX0 = 7'b0010_000;
		4'b1010:	HEX0 = 7'b0001_000;
		4'b1011:	HEX0 = 7'b0000_011;
		4'b1100:	HEX0 = 7'b1000_110;
		4'b1101:	HEX0 = 7'b0100_001;
		4'b1110:	HEX0 = 7'b0000_110;
		4'b1111:	HEX0 = 7'b0001_110;
		
		default: HEX0 = 7'b1000_000;
		endcase
	end
	
	
endmodule