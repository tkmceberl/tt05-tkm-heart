`default_nettype none

module tt_um_tkmheart (
     input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
   output wire [7:0] uio_out,  // IOs: Bidirectional Output path
   output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n
);
	assign uio_out[7:1] = 7'b0000000;
	assign uio_oe  = 8'h00;
    // assign uo_out[7:4]=4'b0000;
//lfsr4 uut (
//    .clk(clk),
//    .reset(io_in[0]),
//    .lfsr(io_out[3:0])
//);
th_flt th_flt  (
    .clk(clk),
    .rst(ui_in[0]),
	.threshold(ui_in[1]),
	.Higher(ui_in[2]),
	.in(ui_in[5:3]),
	.fop(uo_out[7:0]),
	.peak(uio_out[0])
);
endmodule
