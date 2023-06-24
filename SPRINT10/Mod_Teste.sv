`default_nettype none //Comando para desabilitar declaraÃƒâ€šÃ‚Â£o automÃƒÆ’tica de wires
/*`include "ControlUnit.sv"
`include "ULA.sv"
`include "RegisterFile.sv"
// `include "RomInstMem.v"
// `include "RamDataMem.v"
`include "ParallelOut.sv"
`include "ParallelIn.sv"
`include "Mux2x1.sv"
`include "PC.sv"
`include "FreqDivisor.sv"
`include "InstrMemory.sv"
`include "Decodificador.sv"
`include "Adder1.sv"
`include "LCD_TEST.v"
`include "LCD_Controller.v"*/
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

	logic w_RegDst, w_ALUSrc, w_RegWrite, w_Jump, w_MemtoReg, w_MemWrite, w_Branch, w_BNE, w_BEQ, w_BNEpa, w_PCSrc, w_Z, clk, w_We;
	logic [2:0] w_wa3, w_ULAControl; 
	logic [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_PCp1, w_PC, w_RData, w_wd3, w_m1, w_nPC, w_PCBranch, w_MuxToPc, w_RegData;
	logic [31:0] w_RD; 
	
	assign LEDG[1] = ~clk;	// CLK
	assign LEDG[0] = ~KEY[1];	// RST
	assign {LEDR[0], LEDR[1], LEDR[2], LEDR[3], LEDR[4], LEDR[5], LEDR[6], LEDR[7], LEDR[8], LEDR[9], LEDR[10]} = 
		   {w_Jump, w_MemtoReg, w_MemWrite, w_BNE, w_Branch,  w_ULAControl[0], w_ULAControl[1], w_ULAControl[2], w_ALUSrc, w_RegDst, w_RegWrite};
	
	// Inicio da implementação do BNE
	assign w_BNEpa = w_BNE & ~w_Z;
	assign w_BEQ = w_Branch & w_Z;
	assign w_PCSrc = w_BEQ | w_BNEpa; 
	assign w_PCBranch = w_RD[7:0] + w_PCp1;
	// Fim da impletação do BNE
	
	assign w_d0x4 = w_PC;
	
	// Para o teste do BNE
	decodificador decod1(.SW( SW[3:0] ), .QQ( HEX0[0:6] )); 
	decodificador decod2(.SW( SW[7:4] ), .QQ( HEX1[0:6] ));
	
	FreqDivisor #(.BordaDeSubida(25000000)) divisorD (.CLOCK_50( CLOCK_50 ), .LEDG( clk )); // 1Hz
	
	Mux2x1 #(.N(8)) MuxPCSrc( .in0( w_PCp1 ), .in1( w_PCBranch ), .Sel( w_PCSrc ), .out( w_m1 ));

	Mux2x1 #(.N(8)) MuxJump( .in0( w_m1 ), .in1( w_RD[7:0] ), .Sel( w_Jump ), .out( w_nPC ));

	PC ProgramCounter( .PCin( w_nPC ), .clk( clk ), .rst( KEY[1] ), .PC( w_PC ));
	
	Adder1 add(	.In( w_PC ), .Out( w_PCp1 )); 
	
	InstrMemory instruction(	.A( w_PC ), .RD( w_RD )); // Para teste do BNE
	
	// RomInstMem ROM( .address( w_PC ), .clock( CLOCK_50 ), .q( w_RD ));

	ParallelOut Pout( .clk( clk ), .we( w_MemWrite ), .wren( w_We ), .RegData( w_rd2 ), .Address( w_ULAResultWd3 ), .DataOut( w_d1x4 ));
	
	Mux2x1 #(.N(8)) MuxDDest( .in0( w_ULAResultWd3 ), .in1( w_RegData ), .Sel( w_MemtoReg ), .out( w_wd3 ));
	
	// RamDataMem RAM( .address( w_ULAResultWd3 ), .data( w_rd2 ), .clock( CLOCK_50 ), .wren( w_We ), .q( w_RData ));

	ParallelIn Pin(.DataIn( SW[7:0] ), .Address( w_ULAResultWd3 ), .MemData( w_RData ), .RegData( w_RegData ));
	
	ControlUnit control(	.OP( w_RD[31:26] ), .Funct( w_RD[5:0] ), .RegDst( w_RegDst ), .RegWrite( w_RegWrite ), .ULAControl( w_ULAControl ), .ULASrc( w_ALUSrc ),
							   .Jump( w_Jump ), .MemtoReg( w_MemtoReg ), .MemWrite( w_MemWrite ), .Branch( w_Branch ), .BNE( w_BNE ));

	
	RegisterFile #(.N(8)) register(	.wd3(   w_wd3    ), .wa3(  w_wa3   ), .ra1( w_RD[25:21] ), .ra2( w_RD[20:16] ), 
												.we3( w_RegWrite ), .clk(   clk    ), .rst(    KEY[1]   ), .rd1(  w_rd1SrcA  ), 
												.rd2(    w_rd2   ), .S0 (	w_d0x0  ), .S1 (	  w_d0x1   ), .S2 (	 w_d0x2	  ), 
												.S3(	w_d0x3	)  , .S4 ( 	w_d1x0  ), .S5 ( 	  w_d1x1	  ), .S6 (	 w_d1x2 	  ),  .S7(	w_d1x3	));
												
	
	Mux2x1 #(.N(8)) MuxULASrc(	.in0( w_rd2 ), .in1( w_RD[7:0] ), .Sel( w_ALUSrc ), .out( w_SrcB ));
												
	
	ULA ula( .SrcA( w_rd1SrcA ), .SrcB( w_SrcB ), .ULAControl( w_ULAControl ), .Z( w_Z ), .ULAResult( w_ULAResultWd3 ));
	
	
	Mux2x1 #(.N(4)) MuxWR(	.in0( w_RD[20:16] ), .in1( w_RD[15:11]), .Sel( w_RegDst ), .out( w_wa3 ));
	
	
				
endmodule
