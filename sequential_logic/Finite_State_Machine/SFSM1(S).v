module top_module(clk, reset, in, out);
    input clk;
    input reset;    
    input in;
    output out;  
    reg out;

    
	parameter B=1,A=0;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state<=B;
        end else begin
            present_state <= next_state;
        end
    end
    always@(*)begin
         case (present_state)
            A:
                if(in)
            	next_state =A;
            	else
                next_state =B;
            B:
                if(in)
            	next_state =B;
            	else
                next_state =A;
            default:   next_state =B;
         endcase
    	case (present_state)
                A:
                    out = 0;
                B:
                    out =1;
                
         endcase
	end	
endmodule
