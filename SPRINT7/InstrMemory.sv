module InstrMemory(	input logic [7:0] A,
							output logic [31:0] RD);
							
	always_comb
		begin
			case (A)
				8'b00000000: RD = 32'b001000_00000_00001_00000_00000_000011; // ADDi $1, $0, 3
				8'b00000001: RD = 32'b001000_00000_00010_00000_00000_001001; // ADDi $2, $0, 9
				8'b00000010: RD = 32'b000000_00001_00010_00010_00000_100000; // ADD $2, $1, $2
				8'b00000011: RD = 32'b000000_00001_00010_00011_00000_100100; // AND $3, $1, $2
				8'b00000100: RD = 32'b000000_00001_00010_00100_00000_100101; // OR $4, $1, $2
				8'b00000101: RD = 32'b000000_00001_00010_00101_00000_100111; // NOR $5, $1, $2
				8'b00000110: RD = 32'b000000_00101_00100_00110_00000_101010; // SLT $6, $5, $4
				default: 	 RD = 32'b000000_00010_00001_00100_00000_100010; // SUB $4, $1, $2 
			endcase	
		end
	
endmodule
