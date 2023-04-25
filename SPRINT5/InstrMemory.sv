module InstrMemory(	input logic [7:0] A,
			output logic [31:0] RD);
							
							
	always_comb@(*)
		case (A)
			8'b00000000: RD = 32'b001000_00000_00001_00000_00000_000011; // ADDi $1
			8'b00000001: RD = 32'b001000_00000_00010_00000_00000_001001; // ADDi $2
			8'b00000010: RD = 32'b000000_00001_00010_00010_00000_100000; // ADD $2
			8'b00000011: RD = 32'b000000_00001_00010_00011_00000_100100; // AND $3
			8'b00000100: RD = 32'b000000_00001_00010_00100_00000_100101; // OR $4
			default: RD = 32'b000000_00001_00010_00011_00000_101010;     // SLT $4, $1, $2 
		endcase	
							
							
endmodule