module top_module (
    input clk,
    input x,
    output z
); 
    reg[2:0] D ;
    always@(posedge clk)begin
        D[0] <= x^D[0];
        D[1] <= x&(~D[1]);
        D[2] <= x|(~D[2]);
    end
    assign z = ~(|D);
endmodule
