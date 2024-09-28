`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 16:08:14
// Design Name: 
// Module Name: universal_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module universal_tb;
  reg clk, rst_n;
  reg [1:0] select;
  reg [3:0] parallel_in;
  reg s_right_din, s_left_din;
  wire [3:0] parallel_out;
  wire s_right_dout, s_left_dout;
  
  universal_shift_reg usr(
    .clk(clk), 
    .rst_n(rst_n),
    .select(select), 
    .parallel_in(parallel_in),
    .s_right_din(s_right_din),
    .s_left_din(s_left_din),
    .parallel_out(parallel_out),
    .s_right_dout(s_right_dout),
    .s_left_dout(s_left_dout)
  );

  always #2 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    #3 rst_n = 1;

    parallel_in = 4'b1101;
    s_left_din = 1'b1;
    s_right_din = 1'b0;

    select = 2'h3; #10;
    select = 2'h1; #20;
    parallel_in = 4'b1101;  
    select = 2'h3; #10;
    select = 2'h2; #20;
    select = 2'h0; #20;

    $finish;
  end

  initial begin
    $monitor(" select=%b, parallel_in=%b, s_right_in=%b, s_left_din=%b --> parallel_out=%b, s_left_dout=%b, s_right_dout=%b",
              select, parallel_in, s_right_din, s_left_din, parallel_out, s_left_dout, s_right_dout);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
