module Mux2x1(input  logic [7:0] in0, in1,
              input  logic Sel,
              output logic [7:0] out);


    always @(*) begin
        case (Sel)
            1'b0:  out = in0;
				1'b1:  out = in1;
            default: out = 0;
        endcase
    end

endmodule
