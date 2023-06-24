module ControlUnit(	input logic [5:0] OP, Funct,
							output logic Jump, MemWrite, Branch, BNE, ULASrc, RegWrite, MemtoReg, RegDst,
							output logic [2:0] ULAControl );

	always@(*)
		begin 
			casex({OP,Funct})
				12'b000000_100000: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_010_0_0_0_0_0; // ADD	
				12'b000000_100010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_110_0_0_0_0_0; // SUB
				12'b000000_100100: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_000_0_0_0_0_0; // AND
				12'b000000_100101: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_001_0_0_0_0_0; // OR
				12'b000000_100111: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_011_0_0_0_0_0; // NOR
				12'b000000_101010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_1_0_111_0_0_0_0_0; // SLT
				12'b000000_100110: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_x_x_100_0_0_0_0_0; // XOR
				12'b001000_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_0_1_010_0_0_0_0_0; // ADDi
				12'b100011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_0_1_010_0_0_0_1_0; // LW
				12'b101011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b0_x_1_010_0_0_1_x_0; // SW
				12'b000100_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b0_x_0_110_1_0_0_x_0; // BEQ
				12'b000101_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b0_x_0_110_0_1_0_x_0; // BNE
				12'b000010_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b0_x_x_xxx_x_0_0_x_1; // J
				12'b001100_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_0_1_000_0_0_0_0_0; // ANDi
				12'b001101_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_0_1_001_0_0_0_0_0; // ORi
				12'b001110_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,BNE,MemWrite,MemtoReg,Jump} = 11'b1_0_x_100_0_0_0_0_0; // XORi
				
				default: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 11'b0; // Apaga todos os LEDS
			endcase
		end


endmodule
