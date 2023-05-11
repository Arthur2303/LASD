`default_nettype none //Comando para desabilitar declaração automática de wires
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

	//	SPRINT6
	logic w_RegDst, w_ALUSrc, w_RegWrite, w_Jump, w_MemtoReg, w_MemWrite,w_Branch, clk;
	logic [2:0] w_wa3, w_ULAControl;
	logic [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_PCp1, w_PC, w_RData, w_wd3;
	logic [31:0] w_RD; 
	
	assign LEDG[1] = ~clk;	// CLK
	assign LEDG[0] = ~KEY[1];	// RST
	assign {LEDR[0], LEDR[1], LEDR[2], LEDR[3], LEDR[4], LEDR[5], LEDR[6], LEDR[7], LEDR[8], LEDR[9]} = 
			 {w_Jump, w_MemtoReg, w_MemWrite, w_Branch,  w_ULAControl[0], w_ULAControl[1], w_ULAControl[2], w_ALUSrc, w_RegDst, w_RegWrite};
	assign w_d0x4 = w_PC;
	
	
	FreqDivisor #(.BordaDeSubida(25000000)) divisorD (.CLOCK_50( CLOCK_50 ), .LEDG( clk ));
	
	PC ProgramCounter( .PCin( w_PCp1 ), .clk( clk ), .rst( KEY[1] ), .PC( w_PC ));
	
	Adder1 add(	.In( w_PC ), .Out( w_PCp1 )); 
	
	RomInstMem ROM( .address( w_PC ), .clock( CLOCK_50 ), .q( w_RD ));
	
	Mux2x1 #(.N(8)) MuxDDest( .in0( w_ULAResultWd3 ), .in1( w_RData ), .Sel( w_MemtoReg ), .out( w_wd3 ));
	
	RamDataMem RAM( .address( w_ULAResultWd3 ), .data( w_rd2 ), .clock( CLOCK_50 ), .wren( w_MemWrite ), .q( w_RData ));
	
	ControlUnit control(	.OP( w_RD[31:26] ), .Funct( w_RD[5:0] ), .RegDst( w_RegDst ), .RegWrite( w_RegWrite ), .ULAControl( w_ULAControl ), .ULASrc( w_ALUSrc ),
								.Jump( w_Jump ), .MemtoReg( w_MemtoReg ), .MemWrite( w_MemWrite ), .Branch( w_Branch ));

	
	RegisterFile #(.N(8)) register(	.wd3(   w_wd3   ), .wa3(  w_wa3  ), .ra1( w_RD[25:21] ), .ra2( w_RD[20:16] ), 
												.we3( w_RegWrite  ), .clk(   clk  ), .rst(   KEY[1]  ), .rd1(  w_rd1SrcA  ), 
												.rd2(    w_rd2    ), .S0(	w_d0x0	), .S1(	w_d0x1	), .S2(	w_d0x2	), .S3(	w_d0x3	), 
												.S4(	w_d1x0	),.S5(	w_d1x1	), .S6(	w_d1x2	), .S7(	w_d1x3	));
												
	
	Mux2x1 #(.N(8)) MuxULASrc(	.in0( w_rd2 ), .in1( w_RD[7:0] ), .Sel( w_ALUSrc ), .out( w_SrcB ));
												
	
	ULA ula(	.SrcA( w_rd1SrcA ), .SrcB( w_SrcB ), .ULAControl( w_ULAControl ), .ULAResult( w_ULAResultWd3 ));
	
	
	Mux2x1 #(.N(4)) MuxWR(	.in0( w_RD[20:16] ), .in1( w_RD[15:11]), .Sel( w_RegDst ), .out( w_wa3 ));
	

	
				
				
endmodule
