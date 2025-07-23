module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 
    reg nq[15:0][15:0];
    reg m[15:0][15:0];
    integer i,j,di,dj,ni,nj,count;
    always@(posedge clk)begin
        if(load)
           for(i=0;i<16;i++)begin
            for(j=0;j<16;j++)begin
                m[i][j]<=data[i*16+ j];
                q [i*16+j]<=data[i*16+ j];                
            end
           end
        else
           for(i=0;i<16;i++)begin
            for(j=0;j<16;j++)begin
                m[i][j]<=nq[i][j];
                q [i*16+j]<= nq[i][j];                
            end
           end
    end
    always@(*)begin
        for(i=0;i<16;i++)begin
            for(j=0;j<16;j++)begin
                count = 0;
                for(di=-1;di<=1;di++)begin
                    for(dj=-1;dj<=1;dj++)begin
                        if(~(di==0&&dj==0))begin
                            ni = (i+di+16)%16;
                            nj =(j+dj+16)%16;
                            if(m[ni][nj])
                                count++;
                        end
                    end
                end
                
                case(count)
                    0:nq[i][j]=0;
                    1:nq[i][j]=0;
                    2:nq[i][j]=m[i][j];
                    3:nq[i][j]=1;
                    default:nq[i][j]=0;
                endcase
            end
        end
    end

endmodule
