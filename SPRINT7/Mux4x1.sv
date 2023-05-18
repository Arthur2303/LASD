module Mux4x1 #(N = 8)( input  logic [N-1:0] in0, in1, in2, in3,
                        input  logic [1:0] Sel,
                        output logic [N-1:0] out);

    always @(*) begin
        case (Sel)
            2'b00:  out = in0;
				2'b01:  out = in1;
				2'b10:  out = in2;
				2'b11:  out = in3;
            default: out = 0;
        endcase
    end

endmodule
