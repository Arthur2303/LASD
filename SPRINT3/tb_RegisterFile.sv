`include "RegisterFile.sv"

module tb_RegisterFile();

    // Inputs
    logic [7:0] wd3;
    logic [2:0] wa3, ra1, ra2;
    logic we3, clk, rst;
    //Outputs
    logic [7:0] rd1, rd2;

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

    always #2 clk = ~clk;

    initial
        begin
            we3 = 1;
            wa3 = 1;
            #1 wd3 = 8'hAB;
            wa3 = 4;
            #2 wd3 = 8'h5C;
            ra1 = 3'b001;
            ra2 = 3'b100;
        end

    initial
        begin
            $dumpfile("RegisterFile.vcd");
            $dumpvars(0, register);
        end


    initial
        #12 $finish; 


endmodule