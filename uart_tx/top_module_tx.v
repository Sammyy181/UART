module top_module_tx(
    input clk,
    input TxD_start,
    input [7:0] data,
    input reset,
    output TxD,
    output TxD_done
    );
    
    wire transmit_start; 
    
    start_tx ST (.clk(clk),.switch(TxD_start),.transmit(transmit_start),.reset(reset));
    transmitter T1(.clk(clk),.TxD_start(transmit_start),.TxD_data(data),.TxD(TxD),.TxD_done(TxD_done),.reset(reset));
    
endmodule