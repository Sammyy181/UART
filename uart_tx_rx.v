module top_module_tx_rx(
    input clk,
    input RxD,
    input Rx_enable,
    input Rx_reset,
    input Tx_start,
    input Tx_reset,
    output TxD,
    output done,
    output [7:0] data
    );
    
    //wire [7:0] data;
    top_module_rx tR(.clk(clk),.enable(Rx_enable),.reset(Rx_reset),.RxD(RxD),.data(data));
    top_module_tx tT(.clk(clk),.TxD_start(Tx_start),.data(data),.reset(Tx_reset),.TxD(TxD),.TxD_done(done));
    
endmodule