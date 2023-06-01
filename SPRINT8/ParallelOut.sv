module ParallelOut( input logic clk, we, wren, RegData
                    input logic [7:0] Address,
                    output logic [7:0] DataOut );


    // Wires
    logic [7:0] fioA;
    logic       fioB;
    // Reg
    logic [7:0] Registrador;

    assign fioA = (Address == 8'hFF);
    assign fioB = fioA & we;
    assign wren = ~fioA & we;

    always_ff (posedge clk, posedge fioB) begin
        Registrador <= RegData;
    end

    assign DataOut = Registrador;

endmodule
