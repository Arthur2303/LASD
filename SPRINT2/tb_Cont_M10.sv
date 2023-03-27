`include ".\Cont_M10.sv"

module tb_Cont_M10();
    // Input 
    logic clk, rst;
    // Outputs
    logic [3:0] cont;

    Cont_M10 contm10(.clk( clk ), .rst( rst ), .cont( cont ));

    initial 
        begin
            clk = 0;
            rst = 0;
        end

    always #1 clk = ~clk;

    // initial
    //     begin
    //         #2 cont = 4'd1;
    //         #2 cont = 4'd2;
    //         #2 cont = 4'd3;
    //         #2 cont = 4'd4;
    //         #2 cont = 4'd5;
    //         #2 cont = 4'd6;
    //         #2 cont = 4'd7;
    //         #2 cont = 4'd8;
    //         #2 cont = 4'd9;
    //         #2 rst = 1;
    //         #2 cont = 4'd1;
    //     end

        initial
        begin
            $dumpfile("Sprint2.vcd");
            $dumpvars(0, contm10);
        end

    initial
        #20 $finish;


endmodule