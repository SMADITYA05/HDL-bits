module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire[7:0] e,f;
    always@(*)begin
    e=(a<b)?a:b;
    f=(c<d)?c:d;
    min = (e<f)?e:f;
    end
endmodule
