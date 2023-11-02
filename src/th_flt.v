`timescale 1ns / 1ps
module th_flt( input clk, rst,threshold,Higher,
              input [3:0] in,output reg [7:0] fop,
              output peak);
  wire clk2;
  reg [7:0] th , inst ;
  
  always @(posedge clk or negedge rst) begin
    if(~rst) begin
      th<=8'b00;
      inst<=8'b00;
    end
    else 
      case({threshold,Higher})
        2'b00:inst[3:0]<=in;
        2'b01:inst[7:4]<=in;
        2'b10:th[3:0]<=in;
        2'b11:th[7:4]<=in;
      endcase
  end
  
  always @(negedge clk) 
    if(~rst)
      fop<=8'd0;
  else
    if((inst>th)&(Higher))
      fop<=inst;
    else
      fop<=fop;
  
  pk_dt a1(.in(fop),.clk(clk2),.rst(rst),.peak(peak));
  
  clk_div2 a2(.clk(clk),.rst(rst),.clko(clk2));
          
endmodule




  
