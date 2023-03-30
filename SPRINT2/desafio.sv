module desafio(input logic clk, // Vai receber o clock de 1Hz
               output logic [0:6] out);


	 logic [0:6] HEX6;
	 assign out = ~HEX6;
	 
    initial HEX6 = 7'b0000010; // pino 0 do display ativo

    always@(posedge clk)
       begin 
            if(HEX6 != 7'b1000000) begin
                HEX6 <= HEX6 <<  1;
            end
            else begin
                HEX6 <= 7'b0000010;
            end
        end


endmodule
