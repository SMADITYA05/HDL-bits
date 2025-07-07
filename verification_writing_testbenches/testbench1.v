module top_module ( output reg A, output reg B );
    initial begin
    A=0;B=0;
    #10A=1;
    #5B=1;
    #5A=0;
    #20B=0;
    end
endmodule
