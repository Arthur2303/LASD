`include ".\decodificador.sv"

// testebench by Valmir Ferreira
module tb;
    logic [3:0] bincode;
    logic [6:0] pinoutdisplay7segment;
    logic [4:0] pass_fail, pass_test;

    decodificador display7segment(
        .SW  (            bincode          ),
        .QQ  (     pinoutdisplay7segment   )
    );

    task expect_output(
        input [6:0] pinoutdisplay7segment_expect);
        begin   
            if(pinoutdisplay7segment == pinoutdisplay7segment_expect)
                pass_test+=1;
            else begin
                pass_fail+=1;
                $display("%d %b %b",bincode,pinoutdisplay7segment,pinoutdisplay7segment_expect);
            end
        end
    endtask

    initial begin
        pass_fail = 0;
        pass_test = 0;
        $display("expected  : obtained");
        $dumpfile("decod_hex2_7seg.vcd");
        $dumpvars(0,display7segment);
        bincode = 0; #1expect_output(~7'b1111110);
        bincode = 1; #1expect_output(~7'b0110000);
        bincode = 2; #1expect_output(~7'b1101101);
        bincode = 3; #1expect_output(~7'b1111001);
        bincode = 4; #1expect_output(~7'b0110011);
        bincode = 5; #1expect_output(~7'b1011011);
        bincode = 6; #1expect_output(~7'b1011111);
        bincode = 7; #1expect_output(~7'b1110000);
        bincode = 8; #1expect_output(~7'b1111111);
        bincode = 9; #1expect_output(~7'b1111011);
        $display("pass : fail");
        $display("%d    : %d ",pass_test,pass_fail);
    end
endmodule