module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    always@(*)begin
        for(integer i=0;i<3;i++)begin
          out_both[i]= (in[i]&&in[i+1])?1:0;
        end
        for(integer i=3;i>0;i--)begin
            out_any[i]= (in[i]||in[i-1])?1:0;
        end
        for(integer i=0;i<3;i++)begin
            out_different[i]= (in[i]==in[i+1])?0:1;
        end
        out_different[3]= (in[3]==in[0])?0:1;
    end
endmodule
