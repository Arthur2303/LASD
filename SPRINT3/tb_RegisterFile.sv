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

    always #1 clk = ~clk;

    initial begin

        we3 = 1;
        wa3 = 1;
        #1 wd3 = 8'hab;
        #1 wa3 = 4;
        wd3 = 8'hff;
        ra1 = 1;
        #3 ra2 = 4;
        #3 wa3 = 5;
        wd3 = 8'haf;
        ra1 = 5;
        ra2 = 1;
        #5 rst = 0;

        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b0_000_000_000_00001010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_000_000_001_10001010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_001_000_010_10101010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_010_001_011_11001010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_011_010_100_11101010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_100_011_101_10101010;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_101_100_110_10001110;
        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_000_101_111_11111111;

        // #1@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_011_011_011_10001010;
        // #5@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b0_000_000_001_10001010;
        // #7@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b1_000_000_000_10001010;
        // #9@(posedge clk) {we3,ra1,ra2,wa3,wd3} = 18'b0_000_000_001_10001010;

        // #2$finish;

    end

    initial

        begin
            $dumpfile("RegisterFile.vcd");
            $dumpvars(0, register);
        end

    initial 
        #25 $finish;

endmodule