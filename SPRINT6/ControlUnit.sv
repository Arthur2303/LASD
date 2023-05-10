module ControlUnit(	input logic [5:0] OP, Funct,
							output logic Jump, MemtoReg, MemWrite, Branch, ULASrc, RegDst, RegWrite,
							output logic [2:0] ULAControl);

	always@(*)
		begin 
			casex({OP,Funct})
				12'b000000_100000: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_010_0_0_0_0; // ADD	
				12'b000000_100010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_110_0_0_0_0; // SUB
				12'b000000_100100: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_000_0_0_0_0; // AND
				12'b000000_100101: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_001_0_0_0_0; // OR
				12'b000000_100111: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_011_0_0_0_0; // NOR
				12'b000000_101010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_0_111_0_0_0_0; // SLT
				12'b001000_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_0_1_010_0_0_0_0; // ADDi
				12'b100011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_0_1_010_0_0_1_0; // LW
				12'b101011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b0_x_1_010_0_1_x_0; // SW
				default: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_1_111_1_1_1_1; // Não faz nada além de acender todos os LEDS
			endcase
		end


endmodule
