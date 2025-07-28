module top_module(
    input clk,
    input areset,   
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg[3:0] state, next_state;
    parameter left=4'b0000,right=4'b0011,fall_l=4'b0010,fall_r=4'b0001,dig_r=4'b0100,dig_l=4'b0101;

    always @(*) begin
        case(state)
            left:begin
                if(~ground)
                    next_state=fall_l;
                else if(dig)
                    next_state=dig_l;
                else
                next_state=(bump_left)?right:left;
            	end
            right:begin
                if(~ground)
                    next_state=fall_r;
                else if(dig)
                    next_state=dig_r;
                else
                next_state=(bump_right)?left:right;
            	end
            fall_l:begin
                next_state=(ground)?left:fall_l;
            	end
            fall_r:begin
                next_state=(ground)?right:fall_r;
            	end
            dig_l:begin
                next_state=(ground)?dig_l:fall_l;
            	end
            dig_r:begin
                next_state=(ground)?dig_r:fall_r;
            	end
            default:next_state=left;
        endcase          
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=left;
        else
            state<=next_state;
    end
    assign walk_left = (state == left);
    assign walk_right = (state == right);
    assign aaah = (state==fall_r||state==fall_l)?1:0;
    assign digging = (state==dig_r||state==dig_l)?1:0;


endmodule
