module start_tx(
    input switch,
    input clk,
    input reset,
    output reg transmit
    );
    
    reg[30:0] counter;
    
    always @(posedge clk) begin
        if(reset) begin
            counter <= 0;
            transmit <= 0;
        end
        
        else if(switch) begin
            if(counter < 100000) begin
                transmit <= 1;
                counter <= counter + 1;
            end
            else 
                transmit <= 0;             
       end 
    end
    
endmodule
