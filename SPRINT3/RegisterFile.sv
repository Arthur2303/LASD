`include "decodificador.sv"

module RegisterFile #(parameter N = 8)(input  logic [N-1:0] wd3,
           input  logic [3:0] wa3, ra1, ra2,
           input  logic we3, clk, rst,
           output logic [N-1:0] rd1, rd2);
           // ra1 e ra2 são os seletores do mux, ra1 disponibilizando a saída do rd1 e ra2 para o rd2.


    logic [N-1:0] registradores[N-1:0]; // 8 registradores de 8 bits

    always@(posedge clk, negedge rst)
        begin
            case (we3)


            endcase


        end

endmodule

/* Para 32bits
   wa3, ra1, ra2 -> [5:0]
*/