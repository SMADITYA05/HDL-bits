module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    always@(*)begin
        for(integer i=0;i<99;i++)begin
          out_both[i]= (in[i]&&in[i+1])?1:0;
        end
        for(integer i=99;i>0;i--)begin
            out_any[i]= (in[i]||in[i-1])?1:0;
        end
        for(integer i=0;i<99;i++)begin
            out_different[i]= (in[i]==in[i+1])?0:1;
        end
        out_different[99]= (in[99]==in[0])?0:1;
    end

endmodule
