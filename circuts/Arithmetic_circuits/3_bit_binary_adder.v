module top_module#(parameter size = 3)( 
    input [size-1:0] a, b,
    input cin,
    output [size-1:0] cout,
    output [size-1:0] sum );
    full f0(a[0],b[0],cin,sum[0],cout[0]);
    genvar i;
    generate 
        for(i=1;i<size;i++)begin:file
            full fi(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
endmodule
module full(a,b,cin,sum,carry);
  	input a,b,cin;
  	output sum,carry;
  	assign sum = a^b^cin;
  	assign carry= a&b|a&cin|b&cin ;
endmodule
