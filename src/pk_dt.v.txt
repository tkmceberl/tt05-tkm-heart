module pk_dt(input [7:0] in ,
             input clk, rst,
             output peak);
  
  
  reg [7:0] buff[0:2];
  
  always @(posedge clk or negedge rst) begin
    if(~rst)
        {buff[0],buff[1],buff[2]}<=24'd0;
    else
      {buff[0],buff[1],buff[2]}<={in,buff[0],buff[1]};
  end
  
  assign peak=(buff[1]>buff[0])&(buff[1]>buff[2])?1:0;
  
endmodule
