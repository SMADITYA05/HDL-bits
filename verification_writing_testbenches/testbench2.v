module top_module;
    reg clk;
    reg in;
    reg[2:0]s;
    wire out;
    q7 inst(.clk(clk),.in(in),.s(s),.out(out));
    always#5 clk = ~clk;
    initial begin
        clk=0;s = 3'd2;in=0;
        #10 s=3'd6;
        #10 s=3'd2;in=1;
        #10 s=3'd7;in=0;
        #10 s=3'd0;in=1;
        #30 in = 0;
    end
endmodule
