module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire z;
    wire[15:0] sum1,x,y;
    add16 du1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.cout(z),.sum(sum1));
    add16 du2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.cout(),.sum(y));
    add16 du3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.cout(),.sum(x));
    always@(z)begin
    case(z)
        1'b0:sum={y,sum1};
        1'b1:sum ={x,sum1};
    endcase
    end
endmodule
