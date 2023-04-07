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

    // Escrita nos registradores dependendo do clock e reset.
    always@(posedge clk) // reset assí­ncrono
        begin
            if (wa3 && we3) 
				registradores[wa3] <= wd3;
        end

    // Leitura dos valores dos registradores
    assign rd1 = registradores[ra1];
    assign rd2 = registradores[ra2];

endmodule

/*  Para 32bits:
    N = 32 bits
    [5:0] wa3, ra1, ra2;
*/

/* Menor quantidade de linhas

    logic [N-1:0] registradores[N-1:0];
    initial registradores[0] = 0;
    always@(posedge clk, negedge rst) if (wa3 && we3) registradores[wa3] <= wd3; 
    assign rd1 = registradores[ra1];
    assign rd2 = registradores[ra2];

*/