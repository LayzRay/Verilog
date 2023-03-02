module Golev_IVT_22_Lab_1_1 (
	input a, y, 		// Строки №2,3,4 являются описанием
	input [1:0] x,		// входов и выходов цифрового устройства
	output f
);

assign f = (x[1] & a | x[0]) ^ y & (x[1] | y);

endmodule	// Ключевые слова module и endmodule
				// отвечают за структуру одного модуля