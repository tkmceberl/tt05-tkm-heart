`default_nettype none

module tt04_sahrdaya_lfsr (
    input  wire [3:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [3:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire       clk,      // clock);
);
//lfsr4 uut (
//    .clk(clk),
//    .reset(io_in[0]),
//    .lfsr(io_out[3:0])
//);
lfsr4 uut  (
    .clk(clk),
    .reset(io_in[0]),
    .mod(io_in[3:1])
    .lfsr(io_out[3:0])
);
endmodule
