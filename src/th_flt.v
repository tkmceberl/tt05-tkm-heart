`timescale 1ns / 1ps



module th_flt( input clk, rst,threshold,Higher,
              input [3:0] in,output [7:0] fop,
              output peak);
  wire clk2;
  reg [7:0] th , inst , fltop;
  
  always @(posedge clk or negedge rst) begin
    if(~rst) begin
      th<=8'b00;
      inst<=8'b00;
      fltop<=8'b00;
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
    if((inst>th)&(Higher))
      fltop<=inst;
  
  assign fop=fltop;
  
  pk_dt a1(.in(fltop),.clk(clk2),.rst(rst),.peak(peak));
  
  clk_div2 a2(.clk(clk),.rst(rst),.clko(clk2));
          
endmodule
