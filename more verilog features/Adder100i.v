module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    add1 ins0(a[0],b[0],cin,sum[0],cout[0]);
    genvar t;
    generate
        for (t=1;t<100;t++)begin:full_adder
            add1 inst (a[t],b[t],cout[t-1],sum[t],cout[t]);
        end
    endgenerate
endmodule
module add1 ( input a, input b, input cin,   output sum, output cout );
    	assign sum =a^b^cin;
    	assign cout = a&b|a&cin|b&cin ;
endmodule
