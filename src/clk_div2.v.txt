module clk_div2 (input clk,rst,output reg clko);
  always @(posedge clk or negedge rst)
    if(~rst)
      clko<=0;
  else
    clko<=clko+1;
  
endmodule
