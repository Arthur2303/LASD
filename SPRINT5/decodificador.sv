module decodificador #(parameter N = 4 )(input logic [N-1:0] SW,
					 output logic [0:6] QQ);

	logic [0:6] HEX3;
	assign QQ = ~HEX3; // Deixa nível baixo, de acordo com ao FPGA utilizada no lab
				
	always_comb
		begin
			case(SW)
			4'h0:  HEX3 = 7'b1111110;
			4'h1:  HEX3 = 7'b0110000;
			4'h2:  HEX3 = 7'b1101101;
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
			4'hF:  HEX3 = 7'b1000111;
			default: HEX3 = 7'b000000;
			endcase		
		end


endmodule
