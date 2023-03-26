`include ".\decodificador.sv"

module tb();
    //Inputs
    logic [3:0] SW;
    //Outputs
    logic [0:6] HEX3;

    decodificador decod(.SW( SW ), .HEX3( HEX3 ));

    initial 
        begin
            SW = 4'h0;
        end

    initial
        begin
            #2 SW = 4'h1;
            #2 SW = 4'h2;
            #2 SW = 4'h3;
            #2 SW = 4'h4;
            #2 SW = 4'h5;
            #2 SW = 4'h6;
            #2 SW = 4'h7;
            #2 SW = 4'h8;
            #2 SW = 4'h9;
            #2 SW = 4'hA;
            #2 SW = 4'hB;
            #2 SW = 4'hC;
            #2 SW = 4'hD;
            #2 SW = 4'hE;
            #2 SW = 4'hF;
        end

    initial
        begin
            $dumpfile("Sprint2.vcd");
            $dumpvars(0, decod);
        end
    
    initial
        #30 $finish;


endmodule
