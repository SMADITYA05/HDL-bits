module top_module (input x, input y, output z);
 	wire g,h;
     assign g = (x^y) & x;
     assign h = ~(x^y);
     assign z = (g|h) ^ (g&h) ;

endmodule
