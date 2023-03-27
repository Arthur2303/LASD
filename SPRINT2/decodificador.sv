module decodificador(input logic [11:8] SW,
					 output logic [0:6] HEX3);
							
							
	always_comb
		begin
			case(SW)
			4'h0:  HEX3 = 7'b0000000;
			4'h1:  HEX3 = 7'b1111110;
			4'h2:  HEX3 = 7'b0110000;
			4'h3:  HEX3 = 7'b1111001;
			4'h4:  HEX3 = 7'b0110011;
			4'h5:  HEX3 = 7'b1011011;
			4'h6:  HEX3 = 7'b1011111;
			4'h7:  HEX3 = 7'b1110000;
			4'h8:  HEX3 = 7'b1111111;
			4'h9:  HEX3 = 7'b1111011;
			4'hA:  HEX3 = 7'b1110111;
			4'hB:  HEX3 = 7'b0011111;
			4'hC:  HEX3 = 7'b1001110;
			4'hD:  HEX3 = 7'b0111101;
			4'hE:  HEX3 = 7'b1001111;
			4'hF:  HEX3 = 8'b1000111;
			endcase		
		end


endmodule
