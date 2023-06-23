`default_nettype none 
// Synchronous FIFO
module FIFO (       input  logic        clk, rst, RD, WD, // RD - Read Data enable and WD - Write Data enable
                    input  logic  [7:0] Data,        
                    output logic        Empty, Full,      // Define if DataOut is Empty or Full
                    output logic  [7:0] DataOut);


    // auxiliares
    logic [3:0] Count = 0;
    logic [7:0] Queue [7:0];
    logic [2:0] wd_ptr, rd_ptr; // Position of the data that will be Write or Read

    // Whenever the Count is update will check if the array is Empty or Full
    always @(Count) begin
        Empty = (Count==0); 
        Full  = (Count==7); 
    end

    always @(posedge clk ) begin: WriteLogic
        if (WD && !Full) Queue[wd_ptr] <= Data;     // Enables the write operation when is not full
        else if (WD && RD) Queue[wd_ptr] <= Data;   // Enables to write data when some data was read
    end

    always @(posedge clk ) begin: ReadLogic
        if (RD && !Empty) DataOut <= Queue[rd_ptr]; // Enables the read operation when is not empty
        else if (RD && WD) DataOut <= Queue[rd_ptr];// Enables the read data when some data was write 
    end

    // Enable to Walk through the Queue
    always @(posedge clk ) begin: Pointer
        wd_ptr <= ( (WD && !Full)  || (WD && RD) ) ? wd_ptr + 1 : wd_ptr; 
        rd_ptr <= ( (RD && !Empty) || (WD && RD) ) ? rd_ptr + 1 : rd_ptr; 
    end


    always @(posedge clk ) begin
        casex ({WD,RD})
            2'b01: Count <= (Count == 0) ? 0 : Count - 1; 
            2'b10: Count <= (Count == 7) ? 7 : Count + 1;  
            2'bxx: Count <= Count;
            default: Count <= Count;
        endcase
    end


endmodule