module FreqDivisor#(parameter BordaDeSubida = 25000000)
						 (input logic CLOCK_50,
				        output logic LEDG);
	
	logic [25:0]contador = 0; // registrador

	always@(posedge CLOCK_50)
		begin
			if(contador == BordaDeSubida) begin
				LEDG = ~LEDG;
				contador = 0;
			end
			else contador = contador + 1;
		end

endmodule
