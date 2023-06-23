module ParallelIn(  input logic [7:0] MemData, Address, DataIn,
                    output logic [7:0] RegData  );


        assign RegData =  (Address == 8'hFF) ? DataIn : MemData;

endmodule
