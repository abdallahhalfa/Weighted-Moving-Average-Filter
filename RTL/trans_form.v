module trans_form #(parameter N=4)( input clk,rst,
                    		    input [N-1:0] x,
                    		    output reg [N-1:0] y);

reg [N-1:0] x_1,x_2,x_3;                    
                
always@(posedge clk,negedge rst)
  begin
    if(!rst)
      begin
        y<=0;
        x_1<=0;
        x_2<=0;
        x_3<=0;
      end
    else
      begin
        x_1<=(x>>1)+x_2;
        x_2<=(x>>2)+x_3;
        x_3<=(x>>3);
        y<=x+x_1;
      end
  end
//assign  y=x+x_1;  
endmodule