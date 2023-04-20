module ULA(input logic [3:0] A,B,
           input logic [1:0] Sel,
           output logic OVRF, // Flag Overflow
           output logic [3:0] Res);
  
  always@(*)
    begin
      case(Sel) // Se OVRF receber 1 -> Ativa Flag Overflow
        2'b00: {OVRF, Res} = A + B;  // Soma 
        2'b01: {OVRF, Res} = A - B;  // Subtração 
        2'b10: {OVRF, Res} = A >> B; // Deslocamento para direita 
        2'b11: {OVRF, Res} = A << B; // Deslocamento para esquerda 
      endcase
    end
  
endmodule
