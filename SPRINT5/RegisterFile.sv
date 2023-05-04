module RegisterFile #(parameter N = 8)
        (input  logic [N-1:0] wd3,
         input  logic [4:0] wa3, ra1, ra2,
         input  logic we3, clk, rst,
         output logic [N-1:0] rd1, rd2,
			output logic [7:0] S0, S1, S2, S3, S4, S5, S6, S7);
         // ra1 e ra2 são os seletores do mux, ra1 disponibilizando a saí­da no rd1 e ra2 a no rd2.

    logic	[N-1:0] registradores[N-1:0];
	 assign {S0, S1, S2, S3, S4, S5, S6, S7} = {registradores[0], registradores[1], registradores[2], registradores[3], registradores[4], registradores[5], registradores[6], registradores[7]};
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
