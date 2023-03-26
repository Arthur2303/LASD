`include ".\FreqDivisor"

module tb_FreqDivisor();

    //inputs
    logic CLOCK_50;
    //outputs
    logic LEDG;

    FreqDivisor divisor(.CLOCK_50( CLOCK_50 ), .LEDG( LEDG ));

    
    initial
        #30 $finish;


endmodule