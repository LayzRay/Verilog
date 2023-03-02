/* Реализовать такой дешифратор, который позволяет преобразовывать 
двоично-десятичный код, вводимый ключами SW0-SW9, в двоичный, 
который будет показываться на зелёных светодиодах.
При этом на 7-ми сегментные индикаторы должны выводиться числа от 0 до 399.
В случае неправильного ввода числа на индикаторах должно выводиться слово Err */

/* Мы можем подавать единицы напрямую (при этом необходим дешифратор для их вывода на индикаторы).
 При подаче десяток используем другой дешифратор для того, чтобы подданую тетраду "умножить" на 10 
 (при этом используем тот же дешифратор для вывода). Аналогично для сотен. 
 Потом всё это суммируем и выводим на светодиоды. */

module main (SW,HEX0,HEX1,HEX2,HEX3,LEDG);

	input  [9:0] SW;
	output [6:0] HEX0,HEX1,HEX2;
	output reg [6:0] HEX3; 
	output reg [7:0] LEDG;
	
	reg [3:0] bin_1,bin_2,bin_3;
	wire [3:0] bin_1_w, bin_2_w,bin_3_w;
	
	assign bin_1_w = bin_1;
	assign bin_2_w = bin_2;
	assign bin_3_w = bin_3;
	
	
	
	initial begin
	
	bin_1 = 0;
	bin_2 = 0;
	bin_3 = 0;
	end

	function reg [6:0] ten;

	input [3:0] SW;
	
	case(SW)
			
			4'b0000 : ten = 7'd0;
			4'b0001 : ten = 7'd10;
			4'b0010 : ten = 7'd20;	
			4'b0011 : ten = 7'd30;			
			4'b0100 : ten = 7'd40;			
			4'b0101 : ten = 7'd50;			
			4'b0110 : ten = 7'd60;			
			4'b0111 : ten = 7'd70;			
			4'b1000 : ten = 7'd80;			
			4'b1001 : ten = 7'd90;
			
	endcase

	endfunction
	
	function reg [7:0] hundred;
	
	input [1:0] SW;
	
	case(SW)
			
			2'b00 : hundred = 8'd0;
			2'b01 : hundred = 8'd100;
			2'b10 : hundred = 8'd200;
			
	endcase

	endfunction
		     
	initial HEX3 <= 7'b1111_111; // Выключение
	
	always @(SW) begin
	
		if ((SW[3:0] > 4'd9) || (SW[7:4]> 4'd9) || (SW[9:8] > 2'd2)) begin
	
			// Вывод сообщения об ошибке
			
			bin_3 <= 4'b1110;
			bin_2 <= 4'b1111;
			bin_1 <= 4'b1111;
			
		end
		
		else begin
			
			// Сложение чисел
			
			if (hundred(SW[9:8]) + ten(SW[7:4]) + SW[3:0] <= 8'd255) begin
			
				LEDG <= hundred(SW[9:8]) + ten(SW[7:4]) + SW[3:0];
				
				bin_1 <= SW[3:0];
			   bin_2 <= SW[7:4];
			   bin_3 <= {2'b00,SW[9:8]};
				
			end else begin
			
				LEDG <= 8'd0;
				bin_3 <= 4'b1110;
				bin_2 <= 4'b1111;
				bin_1 <= 4'b1111;
			
			end
			
		end
			
	end

   decoder_to_display dtd_1 (.SW(bin_1_w),.HEX(HEX0));
	decoder_to_display dtd_2 (.SW(bin_2_w),.HEX(HEX1));
	decoder_to_display dtd_3 (.SW(bin_3_w),.HEX(HEX2));

endmodule