/* Необходимо создать такое устройство, что при нажатии на кнопку KEY0
 в десятиразрядный сдвиговый регистр LEDR справа записывалось число с ключа SW[0].
 Если случается событие, то надо увеличить счётчик на 1 и вывести на HEX1, HEX0.
 */

module main (SW, KEY,  LEDR, HEX3, HEX2, HEX1, HEX0, CLOCK_50);

	input [9:0] SW;
	input [1:0] KEY;
	input CLOCK_50;
	
	output reg [9:0] LEDR;
	output [6:0] HEX1, HEX0;
	output reg [6:0] HEX3,HEX2;
	
	reg [3:0] counter_1;
	reg [3:0] counter_2;
	reg [2:0] sync_reg = 0;
	reg key_press = 0;
	
	
	initial begin 
	
		LEDR = 9'd0;
		HEX3 = 7'b1111_111;
		HEX2 = 7'b1111_111;
		
		counter_1 = 4'd0;
		counter_2 = 4'd0;
	end
	
	
	always @(posedge CLOCK_50) begin
	
		sync_reg[2] <= !KEY[0];
		sync_reg[1] <= sync_reg[2];
		sync_reg[0] <= sync_reg[1];
		
		key_press <= sync_reg[1]&(!sync_reg[0]);
		
	end
	
	

	always @(posedge CLOCK_50 or negedge KEY[1]) begin
		
		if (!KEY[1]) begin
		
			LEDR = 9'd0;
			counter_1 = 4'd0;
			counter_2 = 4'd0;
			
		end else begin
		
		if (key_press) begin
		
			if (^LEDR) begin
				
				if (counter_1 != 4'd9)
				
					counter_1 = counter_1 + 1;
					
				else
				
					if (counter_2 != 4'd9) begin
					
						counter_1 = 4'd0;
						counter_2 = counter_2 + 1;
						
					end else begin 
					
					counter_1 = 4'd0; 
					counter_2 = 4'd0;
					
				end
			end
			
			LEDR = {LEDR[8:0],SW[0]};
	
		end
		end
	end
	
	decoder_to_display dtd_1(.SW(counter_1), .HEX(HEX0));
	decoder_to_display dtd_2(.SW(counter_2), .HEX(HEX1));

endmodule
