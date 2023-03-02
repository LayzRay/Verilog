module main (KEY, HEX3, HEX2, HEX1, HEX0, CLOCK_50);

	input [3:0] KEY;
	input CLOCK_50;
	output [6:0] HEX3, HEX2, HEX1, HEX0;
	
	reg [3:0] counter_001;
	reg [3:0] counter_01;
	reg [3:0] counter_1;
	reg [3:0] counter_10;
	
	reg [2:0] sync_reg = 0;
	reg button_was_pressed = 0;
	reg device_running = 0;
	
	reg [18:0] pulse_counter;
	
	wire hundredth_of_second_passed = (pulse_counter == 19'd499999);
	wire tenth_of_second_passed = ((counter_001 == 4'd9) & hundredth_of_second_passed);
	wire one_of_second_passed = ((counter_01 == 4'd9) & tenth_of_second_passed);
	wire ten_of_second_passed = ((counter_1 == 4'd9) & one_of_second_passed);
	
	wire bin_1,bin_2,bin_3,bin_4;
	

	
	initial begin 
	
		pulse_counter = 19'd0;
		
		counter_001 = 4'd0;
		counter_01 = 4'd0;
		counter_1 = 4'd0;
		counter_10 = 4'd0;
		
	end
	
	
	always @(posedge CLOCK_50) begin
	
		sync_reg[2] <= !KEY[0];
		sync_reg[1] <= sync_reg[2];
		sync_reg[0] <= sync_reg[1];
		
		button_was_pressed <= sync_reg[1]&(!sync_reg[0]);
		
	end
	

	always @(posedge CLOCK_50 or negedge KEY[1]) begin
		
		if (!KEY[1]) begin
		
			counter_001 <= 4'd0;
			counter_01  <= 4'd0;
			counter_1   <= 4'd0;
			counter_10  <= 4'd0;
			device_running <= 0;
			pulse_counter <= 19'd0;
			
		end 
		else begin
		
			if (button_was_pressed)
			
				device_running <= !device_running;
			
			if (device_running | hundredth_of_second_passed) begin
			
				if (hundredth_of_second_passed) begin
				
					pulse_counter <= 0;
					counter_001 <= counter_001 + 1;
			
				end
				else pulse_counter <= pulse_counter + 1;
				 
				if (tenth_of_second_passed) begin
					counter_001 <= 0;		
					if (counter_01 <= 4'd9) counter_01 <= counter_01 + 1; end
					
									
				if (one_of_second_passed) begin
					counter_01 <= 0;
					if (counter_1 <= 4'd9)  counter_1 <= counter_1 + 1; end
													
				if (ten_of_second_passed) begin
					counter_1 <= 0;
					if (counter_10 <= 4'd9)  counter_10 <= counter_10 + 1; end
			end				
		end		
	end
	
	decoder_to_display dtd_1(.SW(counter_001), .HEX(HEX0));
	decoder_to_display dtd_2(.SW(counter_01), .HEX(HEX1));
	decoder_to_display dtd_3(.SW(counter_1), .HEX(HEX2));
	decoder_to_display dtd_4(.SW(counter_10), .HEX(HEX3));

endmodule