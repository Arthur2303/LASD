`include "desafio.sv"

module tb_desafio();
    //Inputs
    logic clk;
    //Outputs
    logic [6:0] cont;

    desafio Desafio(.clk( clk ), .cont ( cont[6:0]));

    initial clk = 0;

    always #1 clk = ~clk;

    initial
        begin
            $dumpfile("Desafio.vcd");
            $dumpvars(0, Desafio);
        end

    initial
        #20 $finish;

endmodule