module top_module(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging ); 
    reg[4:0] i;
    reg[3:0] state, next_state;
    parameter left=4'b0000,right=4'b0011,fall_l=4'b0010,fall_r=4'b0001,dig_r=4'b0100,dig_l=4'b0101,splat=4'b0110;

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
                if(ground&&i>19)
                    next_state=splat;
                else
                next_state=(ground)?left:fall_l;
            	end
            fall_r:begin
                if(ground&&i>19)
                    next_state=splat;
                else
                next_state=(ground)?right:fall_r;
            	end
            dig_l:begin
                next_state=(ground)?dig_l:fall_l;
            	end
            dig_r:begin
                next_state=(ground)?dig_r:fall_r;
            	end
            splat:begin
            	end
            default:next_state=left;
        endcase
    end

    always @(*) begin
        if(state == splat)begin
        	walk_left =0;
        	walk_right =0; 
            aaah=0;
            digging =0;
        end
       else if(state == left)begin
            walk_left =1;
        	walk_right =0;
            aaah=0;
            digging = 0;
        end
        else if(state == right)begin
        	walk_left =0;
        	walk_right =1; 
            aaah=0;
            digging =0;
        end
        else if(state==fall_r||state==fall_l)begin
            walk_left =0;
        	walk_right =0; 
            aaah=1;
            digging =0;
        end
        else if(state==dig_r||state==dig_l)begin
            walk_left =0;
        	walk_right =0; 
            aaah=0;
            digging =1;
        end
    end
    always @(posedge clk, posedge areset) begin
        
        if(areset)begin
            state<=left;
        	i<=0;
        end
        else if(~ground&&i<21&&(state==fall_l||state ==fall_r))
            i<=i+1;
        else begin
            state<=next_state;
            if(state==splat||(ground&&(state==fall_l||state ==fall_r)))begin
            	i<=0;
            end
        end
    end
endmodule
