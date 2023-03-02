module RS_trig(nR, nS, Q, nQ); // SR - защёлка на базе "И-НЕ"
	
	input nR, nS; // Подаём инвертированные сигналы (вводим 0 - получается 1 для "ИЛИ-НЕ")
	output Q,nQ;
	
	assign Q = ~(nS & nQ);
	assign nQ = ~(nR & Q);
	
endmodule
