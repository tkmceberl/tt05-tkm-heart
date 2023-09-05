`default_nettype none

module tt_um_sahrdayalfsr (
     input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
   // input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
  //  output wire [7:0] uio_out,  // IOs: Bidirectional Output path
  //  output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n 
);
//lfsr4 uut (
//    .clk(clk),
//    .reset(io_in[0]),
//    .lfsr(io_out[3:0])
//);
lfsr4 lfsr4  (
    .clk(clk),
    .reset(ui_in[0]),
     .mod(ui_in[3:1]),
    .lfsr(uo_out[3:0])
);
endmodule
