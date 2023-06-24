module ULA(	input logic [8:0] SrcA,SrcB,
           	input logic [2:0] ULAControl,
           	output logic Z, 
           	output logic [8:0] ULAResult);
  
  always@(*)
    begin
      case(ULAControl) 
			3'b000: ULAResult = SrcA & SrcB;    	    	// Bitwise And
			3'b001: ULAResult = SrcA | SrcB;    			// Bitwise Or 
			3'b010: ULAResult = SrcA + SrcB;    			// Soma 
			3'b011: ULAResult = ~(SrcA | SrcB); 			// NOR
			3'b100: ULAResult = SrcA ^ SrcB;					// XOR
			3'b110: ULAResult = SrcA + (~SrcB) + 1; 		// Subtração
			3'b111: ULAResult = SrcA < SrcB;					// SLT
      endcase
		Z = ULAResult ? 0 : 1;
    end
  
endmodule

