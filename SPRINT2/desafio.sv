module desafio(input logic clk, // Vai receber o clock de 1Hz
               output logic [6:0] cont);


    // Cátodo comum
    // initial cont = 7'b1000000; // pino 0 do display ativo

    // always@(posedge clk)
    //     begin 
    //         if(cont > 7'b0000010) begin
    //             cont <= cont >> 1;
    //         end
    //         else begin
    //             cont <= 7'b1000000;
    //         end
    //     end

    // Ânodo comum
    initial cont = 7'b0111111;
    
        always@(posedge clk)
        begin 
            if(cont > 7'b1111101) begin
                cont <= cont >> 1;
            end
            else begin
                cont <= 7'b0111111;
            end
        end

endmodule

/*
Display
0 -> ~7'b1000000;
1 -> ~7'b0100000;
2 -> ~7'b0010000;
3 -> ~7'b0001000;
4 -> ~7'b0000100;
5 -> ~7'b0000010;
*/