module Cont_M10(input logic clk, rst,
				output logic [3:0] cont);

					 
	logic contador = 0;

	always@(posedge clk)
		begin
			if(contador <= 4'd9) begin
				contador = contador + 1;
				cont = contador;
			end
			else begin
				contador = 0;
				cont = contador;
			end
		end

endmodule
