module ControlUnit(	input logic [5:0] OP, Funct,
							output logic Jump, MemWrite, Branch, ULASrc, RegWrite, Jal, Jr,
							output logic [1:0] MemtoReg, RegDst, // Desafio
							output logic [2:0] ULAControl);

	// SPRINT7
	/*always@(*)
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
				12'b000100_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b0_x_0_110_1_0_x_0; // BEQ
				12'b000010_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b0_x_x_xxx_x_0_x_1; // J
				default: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 10'b1_1_1_111_1_1_1_1; // Acende todos os LEDS
			endcase
		end*/
		

	// Desafio
	always@(*)
		begin 
			casex({OP,Funct})
				12'b000000_100000: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_010_0_0_00_0_0; // ADD	
				12'b000000_100010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_110_0_0_00_0_0; // SUB
				12'b000000_100100: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_000_0_0_00_0_0; // AND
				12'b000000_100101: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_001_0_0_00_0_0; // OR
				12'b000000_100111: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_011_0_0_00_0_0; // NOR
				12'b000000_101010: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_01_0_111_0_0_00_0_0; // SLT
				12'b001000_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_00_1_010_0_0_00_0_0; // ADDi
				12'b100011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b1_00_1_010_0_0_10_0_0; // LW
				12'b101011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b0_xx_1_010_0_1_xx_0_0; // SW
				12'b000100_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b0_xx_0_110_1_0_xx_0_0; // BEQ
				12'b000011_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b0_xx_x_xxx_x_0_xx_1_0; // JAL
				12'b000000_xxxxxx: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jal,Jr} = 13'b0_xx_x_xxx_x_0_xx_0_1; // JR
				default: {RegWrite,RegDst,ULASrc,ULAControl,Branch,MemWrite,MemtoReg,Jump} = 13'b1_11_1_111_1_1_11_1_1; // Acende todos os LEDS
			endcase
		end


endmodule
