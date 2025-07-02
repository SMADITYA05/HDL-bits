module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire[99:0] k;
    bcd_fadd ins0(a[3:0],b[3:0],cin,k[0],sum[3:0]);
    genvar t;
    generate
        for (t=1;t<100;t++)begin:bcd_adder
            bcd_fadd inst (a[t*4+3:t*4],b[t*4+3:t*4],k[t-1],k[t],sum[t*4+3:t*4]);
        end
    endgenerate
    assign cout = k[99];

endmodule
