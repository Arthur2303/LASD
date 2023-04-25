module ControlUnit(	input logic [5:0] OP, Funct,
					output logic Jump, MemtoReg, MemWrite, Branch, ULASrc, RegDst, RegWrite,
					output logic [2:0 ULAControl]);


	// Instrução do tipo R: OP = 6'b000000 e Funct variando
	// ADDi OP = 6'b001000 e Funct 6'bxxxxxx

	always_comb@(*)
		begin 
			if(OP == 6'b000000 && Funct == 6'b100000) begin // ADD
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_010_0_0_0_0;
			end
			if(OP == 6'b000000 && Funct == 6'b100010) begin // SUB
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_110_0_0_0_0;
			end
			if(OP == 6'b000000 && Funct == 6'b100100) begin // AND
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_000_0_0_0_0;
			end
			if(OP == 6'b000000 && Funct == 6'b100101) begin // OR
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_001_0_0_0_0;
			end
			if(OP == 6'b000000 && Funct == 6'b101010) begin // SLT
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_111_0_0_0_0;
			end
			if(OP == 6'b001000) begin // ADDi
				{RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_010_0_0_0_0;
			end
		end


endmodule
