module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] sum1,sum2;
    wire c1;
    add16 du1(.a(a[15:0]),.b(b[15:0]),.sum(sum1),.cin(1'b0),.cout(c1));
    add16 du2(.a(a[31:16]),.b(b[31:16]),.sum(sum2),.cin(c1),.cout());
    assign sum = {sum2,sum1};            

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    	assign sum =a^b^cin;
    	assign cout = a&b|a&cin|b&cin ;

endmodule
