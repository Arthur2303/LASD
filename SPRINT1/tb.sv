`include ".\ULA.sv"

// Testbench here
module tb();
  //Inputs
  logic [3:0] A,B;
  logic [1:0] Sel;
  //Outputs
  logic OVRF;
  logic [3:0] Res;
  
  ULA ula(.A(A), .B( B ), .Sel( Sel),
          .OVRF( OVRF ),
          .Res( Res));
  
  initial
    begin  
      A = 4'b0011;
      B = 4'b0111;    
    end

  initial
    begin
        #2 Sel = 4'b00;
        A = 4'b1010;
        #2 Sel = 4'b01;
        #2 Sel = 4'b10;
        B = 4'b0001;
        #2 Sel = 4'b11;
    end
  
  initial
    begin
        $dumpfile("Sprint1.vcd");
        $dumpvars(0, ula);
    end

  initial 
    #20 $finish;
    
endmodule