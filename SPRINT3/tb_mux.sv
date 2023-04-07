`include "Mux.sv"
module tb_mux();

    // Inputs
    logic [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
    logic [2:0] Sel;
    // Outputs
    logic [7:0] out;

    Mux #(.nBit(8)) mux(.in0( in0 ), .in1( in1 ), .in2( in2 ), .in3( in3 ), 
                        .in4( in4 ), .in5( in5 ), .in6( in6 ), .in7( in7 ),
                        .Sel( Sel ), .out( out ));

    initial begin
        Sel = 3'b0;
        in0 = 8'b00000000;
        in1 = 8'b00000000;
        in2 = 8'b00000000;
        in3 = 8'b00000000;
        in4 = 8'b00000000;
        in5 = 8'b00000000;
        in6 = 8'b00000000;
        in7 = 8'b00000000;
    end


    initial
        begin
            in0 = 8'b00001010;
            #2 Sel = 3'b000;
            in1 = 8'b00000001;
            #2 Sel = 3'b001;
            in3 = 8'b00000111;
            #2 Sel = 3'b011;
            in6 = 8'b00000111;
            #2 Sel = 3'b110;
        end

    initial
        begin
            $dumpfile("Mux.vcd");
            $dumpvars(0, mux);
        end

    initial
        #20 $finish;

endmodule