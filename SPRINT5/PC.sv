module PC(	input logic  [7:0] PCin,
			input logic clk, output logic [7:0] PC); 
				
		
	always_ff@(posedge clk)
		begin
			PC <= PCin;
		end
		
endmodule
