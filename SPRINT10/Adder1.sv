module Adder1(	input logic  [7:0] In,
					      output logic [7:0] Out);

					
	always@(*) Out = In + 1'b1;

endmodule
