`timescale 1ns / 1ps



module lfsr4(
    input clk,
    input reset,
    input [2:0] mod,
    output reg [3:0] lfsr 
    );
    
    always @(posedge clk or posedge reset)
  
        if(reset)
            lfsr <= 4'b1010;
        else  begin
        if(mod==0)begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[3] ~^ lfsr[0];
            end
            else if (mod==2) begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[1] ~^ lfsr[0];
            end
            else if(mod==3)begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[2] ~^ lfsr[0];
             end
            else if (mod==1) begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[3] ~^ lfsr[1];
             end
            else if (mod==4) begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[2] ~^ lfsr[1];
            end
            else if (mod==5) begin
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[0] ~^ lfsr[1];
            end
            else if (mod==6) 
            lfsr[3:1] <= lfsr[2:0];
            lfsr[0] <= lfsr[3] ~^ lfsr[2];
        end
            
endmodule
