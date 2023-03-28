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

    initial
        begin
            $dumpfile("Sprint2.vcd");
            $dumpvars(0, contm10);
        end

    initial 
        begin
        #6 rst = 1;
        #3 rst = 0;
        end
    initial
        #35 $finish;


endmodule