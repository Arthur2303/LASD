module RegisterFile #(parameter N = 8)
        (input  logic [N-1:0] wd3,
         input  logic [2:0] wa3, ra1, ra2,
         input  logic we3, clk, rst,
         output logic [N-1:0] rd1, rd2);
         // ra1 e ra2 são os seletores do mux, ra1 disponibilizando a saí­da no rd1 e ra2 a no rd2.

    // 8 registradores de 8 bits
    logic  [N-1:0] registradores[N-1:0];

    // OBS: O registrador $0 é somente de LEITURA e seu valor deve ser fixo em ZERO.
    initial registradores[0] = 0;

    // Escrita nos registradores dependendo do clock.
    always@(posedge clk)
        begin
            if (wa3 && we3) registradores[wa3] <= wd3;
            if ( !rst )
            begin
                registradores[0] <= 0;	registradores[1] <= 0;	
                registradores[2] <= 0;	registradores[3] <= 0;	
                registradores[4] <= 0;	registradores[5] <= 0;	
                registradores[6] <= 0;	registradores[7] <= 0;	
            end
        end

    // Leitura dos valores dos registradores
    assign rd1 = registradores[ra1];
    assign rd2 = registradores[ra2];

endmodule


module tb_RegisterFile;

    // Inputs
    logic [7:0] wd3;
    logic [2:0] wa3, ra1, ra2;
    logic we3, clk, rst;
    //Outputs
    logic [7:0] rd1, rd2;
	 
    `timescale 1us/10ns

    RegisterFile #(.N(8)) register( .wd3( wd3 ), .wa3( wa3 ), .ra1( ra1 ), .ra2( ra2 ), 
								    .we3( we3 ), .clk( clk ), .rst( rst ), .rd1( rd1 ), 
								    .rd2( rd2 ));

    initial
        begin
             wd3 = 0;
             wa3 = 0;
             ra1 = 0;
             ra2 = 0;
             we3 = 0;
             rst = 1;   
             clk = 0;     
        end

    always #1 clk = ~clk;

    initial begin
			
		  rst = 0;
		  #2 rst = 1;
        we3 = 1;
        wa3 = 1;
        #1 wd3 = 8'hab;
        #1 wa3 = 4;
        wd3 = 8'hff;
        ra1 = 1;
        #3 ra2 = 4;
        #3 wa3 = 5;
        wd3 = 8'haf;
        #1 ra1 = 5;
        ra2 = 1;
   
    end

    initial

        begin
            $dumpfile("RegisterFile.vcd");
            $dumpvars(0, register);
        end

    initial 
        #20 $finish;

endmodule

/*  Para 32bits:
    N = 32 bits
    [5:0] wa3, ra1, ra2;
*/

/* Menor quantidade de linhas

    logic [N-1:0] registradores[N-1:0];
    initial registradores[0] = 0;
    always@(posedge clk, negedge rst) if (wa3 && we3) registradores[wa3] <= wd3; 
    if ( !rst ) begin
                registradores[0] <= 0;	registradores[1] <= 0;	
                registradores[2] <= 0;	registradores[3] <= 0;	
                registradores[4] <= 0;	registradores[5] <= 0;	
                registradores[6] <= 0;	registradores[7] <= 0;	
                end
    assign rd1 = registradores[ra1];
    assign rd2 = registradores[ra2];

*/

