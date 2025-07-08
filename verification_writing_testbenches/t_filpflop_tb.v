module top_module;
    reg clk,reset,t;
    wire q;
    tff dut(.clk(clk),.reset(reset),.t(t),.q(q));
    always#5 clk = ~clk;
    initial begin
    reset = 1;
    clk = 0;
    #6 reset = 0;
    #5 t = 1;
    #5 t = 0; 
    #5 t = 1;
    #5 t = 0; 
    #5 t = 1;
    #5 t = 0; 
    #5 t = 1;
    #5 t = 0; 
    end
endmodule
