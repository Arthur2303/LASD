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

	//	SPRINT5
	logic w_RegDst, w_ALUSrc, w_RegWrite;
	logic [2:0] w_wa3, w_ULAControl;
	logic [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_PCp1, w_PC;
	logic [31:0] w_RD; // Conecta Saída da Memória de Intruções com entradas do BDR, MuxWR e Unidade de Controle.
	
	assign w_d0x0 = w_rd1SrcA; 	assign w_d1x0 = w_rd2;	
	assign w_d1x1 = w_SrcB;		assign w_d0x4 = w_ULAResultWd3;
	assign w_d0x4 = w_PC;
	
	
	InstrMemory instruction(		.A( w_ PC ), .RD( w_RD ));
	
	
	ControlUnit control(			.OP( w_RD[31:26] ), .Funct( w_RD[5:0] ), .Jump(  ), .MemtoReg(), .MemWrite(), .Branch(), .ULASrc, RegDst(), .RegWrite(), .ULAControl());
	
	
	RegisterFile #(.N(8)) register(		.wd3(   SW[7:0]   ), .wa3(  w_wa3  ), .ra1( w_RD[25:21] ), .ra2( w_RD[20:16] ), 
						.we3( w_RegWrite  ), .clk(   KEY[1]  ), .rst(   KEY[2]  ), .rd1(  w_rd1SrcA  ), 
						.rd2(    w_rd2    ));
												
	
	Mux2x1 #(.N(8)) MuxULASrc( 		.in0( w_rd2 ), .in1( 8'h07 ), .Sel( w_ALUSrc ), .out( w_SrcB ));
												
	
	ULA ula(				.SrcA( w_rd1SrcA ), .SrcB( w_SrcB ), .ULAControl( w_ULAControl ), .Z( LEDG[0] ), 
						.ULAResult( w_ULAResultWd3 ));
	
	
	Mux2x1 #(.N(4)) MuxWR( 			.in0( w_RD[20:16] ), .in1( w_RD[15:11]), .Sel( w_RegDst ), .out( w_wa3 ));


	// SPRINT4
	/*
	assign w_d0x0 = w_rd1SrcA;
	assign w_d1x0 = w_rd2;	
	assign w_d1x1 = w_SrcB;
	assign w_d0x4 = w_ULAResultWd3;
	
	logic [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;
	
	RegisterFile #(.N(8)) register(	.wd3(   SW[7:0]   ), .wa3( SW[16:14] ), .ra1( SW[13:11] ), .ra2(   3'b010    ), 
												.we3(     1'b1    ), .clk(   KEY[1]  ), .rst(   KEY[2]  ), .rd1(  w_rd1SrcA  ), 
												.rd2(    w_rd2    ));
												
	Mux2x1 MuxULASrc( .in0( w_rd2 ), .in1( 8'h07 ), .Sel( SW[17] ), .out( w_SrcB ));
												
	ULA ula(	.SrcA( w_rd1SrcA ), .SrcB( w_SrcB ), .ULAControl( SW[10:8] ), .Z( LEDG[0] ), .ULAResult( w_ULAResultWd3 ));*/
												

	// SPRINT3
	/*assign LEDG[8] = ~KEY[1];

	decodificador #(.N(4)) decod1(.SW( SW[3:0] ), .QQ( HEX0[0:6] ));
	
	decodificador #(.N(4)) decod2(.SW( SW[7:4] ), .QQ( HEX1[0:6] ));
	
	RegisterFile #(.N(8)) register(.wd3(   SW[7:0]   ), .wa3( SW[16:14] ), .ra1( SW[13:11] ), .ra2(   SW[10:8]  ), 
				       .we3(   SW[17]    ), .clk(   KEY[1]  ), .rst(   KEY[2]  ), .rd1( w_d0x0[7:0] ), 
				       .rd2( w_d0x1[7:0] ));*/
	

	// SPRINT2 
	/*wire connection1, connectionDesafio; 
	wire [3:0] connection2;

	assign HEX0[0:6] = SW[6:0]; // Item 1
	
	decodificador decod(.SW( SW[11:8] ), .QQ( HEX3[0:6] )); // Item 2
	
	FreqDivisor divisor(.CLOCK_50( CLOCK_50 ), .LEDG( LEDG[0] )); // Item 3
	
	// Item 4
		
	FreqDivisor divisor2(.CLOCK_50( CLOCK_50 ), .LEDG( connection1 ));
	
	Cont_M10 counter(.clk(connection1), .rst( KEY[1]), .cont( connection2 ));

	decodificador decod2(.SW( connection2 ), .QQ( HEX4[0:6] )); 
	
	// Desafio
	
	FreqDivisor #(.BordaDeSubida(4166666)) divisorD(.CLOCK_50( CLOCK_50 ), .LEDG( connectionDesafio ));
	
	desafio desafD(.clk( connectionDesafio ), .out( HEX6[0:6] ));*/
	

	// SPRINT1
	/*ULA instULA(.A( SW[3:0] ), .B( SW[7:4] ), 
            .Sel( SW[17:16]), .OVRF( LEDG[0] ),
            .Res( LEDR[3:0] ));*/
				
				
endmodule
