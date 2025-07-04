module top_module( 
    input [2:0] in,
    output [1:0] out );
    wire[1:0] count;
    always@(*)begin
        count =0;
        for(int i =0;i<3;i++)begin
            count = (in[i])?count+1:count;
        end
    end
    assign out = count;
endmodule
