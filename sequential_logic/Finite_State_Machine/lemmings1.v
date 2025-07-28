module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 
    reg state, next_state;
    

    always @(*) begin
        case(state)
            1:begin
            	next_state=(bump_left)?0:1;
            	end
            0:begin
                next_state=(bump_right)?1:0;
            	end
            default:next_state=1;
        endcase          
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=1;
        else
            state<=next_state;
    end
        assign walk_left = (state == 1);
        assign walk_right = (state == 0);
endmodule
