module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire[3:0] cout;
    full f0(x[0],y[0],1'b0,sum[0],cout[0]);
    full f1(x[1],y[1],cout[0],sum[1],cout[1]);
    full f2(x[2],y[2],cout[1],sum[2],cout[2]);
    full f3(x[3],y[3],cout[2],sum[3],sum[4]);
    
endmodule
module full(x,y,cin,sum,cout);
  	input x,y,cin;
  	output sum,cout;
  	assign sum = x^y^cin;
  	assign cout= x&y|x&cin|y&cin ;
endmodule
