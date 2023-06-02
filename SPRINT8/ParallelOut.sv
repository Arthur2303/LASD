module ParallelOut( input logic clk, we,
                    input logic [7:0] Address, RegData,
                    output logic [7:0] DataOut,
						  output logic wren);


    // Wires
    logic fioA;
    logic fioB;
    // Reg
    logic [7:0] Registrador;

    assign fioA = (Address == 8'hFF);
    assign fioB = fioA & we;
    assign wren = (~fioA & we);

    always_ff @(posedge clk) begin
		if(fioB) Registrador <= RegData;
    end

    assign DataOut = Registrador;

endmodule
