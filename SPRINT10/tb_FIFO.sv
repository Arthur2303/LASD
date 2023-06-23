`include "FIFO.sv"

module tb_FIFO();

    // Inputs
    logic        clk, rst, RD, WD;
    logic  [7:0] Data;    
    // Outputs
    logic       Empty, Full;
    // logic [3:0] Miss, PageFault;
    // logic [2:0] Hit;
    logic [7:0] DataOut;

    FIFO fifo( .clk( clk ), .RD( RD ), .WD( RD ), .Data( Data ), .Empty( Empty ), .Full( Full ), .DataOut( DataOut ));
    
    initial begin
        clk = 0;
        Data = 7'd10;
        WD = 1'b1;
        RD = 1'b0;
        forever #1 clk = ~clk;
    end

    initial begin
        $dumpfile("FIFO.vcd");
        $dumpvars(0,fifo);
        $monitor("Data: %d, Empty: %b, Full: %b, DataOut: %d.", Data, Empty, Full, DataOut);
    
    end


    initial #5 $finish;


endmodule