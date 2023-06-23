module PC(	input logic  [7:0] PCin,
		input logic clk, rst,
		output logic [7:0] PC); 
				
		
	always_ff@(posedge clk)
		begin
			if( !rst ) PC <= 0;
			else PC <= PCin;
		end
		
endmodule
