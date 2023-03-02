module Golev_IVT_22_Lab_1_2 (
	
	input a_man_going_through,
	input ticket_was_attached,
	output a_man_can_go
);

assign a_man_can_go = (ticket_was_attached & ~a_man_going_through) | (ticket_was_attached & a_man_going_through);
	
endmodule