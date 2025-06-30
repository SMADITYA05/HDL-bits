module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[15:0] sum1,sum2;
    wire[31:0] bxorsub;
    wire c1;
    add16 du1(.a(a[15:0]),.b(bxorsub[15:0]),.sum(sum1),.cin(sub),.cout(c1));
    add16 du2(.a(a[31:16]),.b(bxorsub[31:16]),.sum(sum2),.cin(c1),.cout());
    assign bxorsub =b ^ {32{sub}};
    assign sum = {sum2,sum1};
endmodule
