module BaudTickGen(input clk, enable, output tick);

    parameter ClkFrequency = 100000000;
    parameter Baud = 9600;
    parameter Oversampling = 1;
    
    function integer log2(input integer v);
    
    begin log2=0;
    
    while (v >> log2) log2=log2+1;

    end
    
    endfunction
    localparam AccWidth = log2(ClkFrequency/Baud)+8;
    
    reg [AccWidth:0] Acc = 0;

    localparam ShiftLimiter = log2(Baud*Oversampling >> (31-AccWidth));
    
    localparam Inc = ((Baud*Oversampling << (AccWidth-ShiftLimiter)) + (ClkFrequency>>(ShiftLimiter+1)))/(ClkFrequency>>ShiftLimiter) ;
    
    always @(posedge clk) begin
         if(enable) Acc <= Acc[AccWidth-1:0] + Inc[AccWidth:0]; 
         else Acc <= Inc[AccWidth:0];
     end

    assign tick = Acc[AccWidth];


endmodule