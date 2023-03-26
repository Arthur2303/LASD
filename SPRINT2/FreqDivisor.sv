module FreqDivisor(input logic CLOCK_50,
				   output logic LEDG);
		 
	// A cada 25MHz inverta a saída

	parameter BordaDeSubida = 25000000; // Quantidade de bordas de subida
	logic contador = 0;


	always@(posedge CLOCK_50)
		// begin
		// 	(contador == BordaDeSubida) ? LEDG = ~LEDG : contador = contador + 1; 
		// end
		begin
			if(contador == BordaDeSubida) begin
				LEDG = ~LEDG;
				contador = 0;
			end
			else contador = contador + 1;
		end

endmodule
