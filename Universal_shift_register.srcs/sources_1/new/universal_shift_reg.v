`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 15:45:23
// Design Name: 
// Module Name: universal_shift_reg
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


module universal_shift_reg(
input clk,rst_n,
 input[1:0] select,
 input[3:0] parallel_in,
 input s_left_din,
 input s_right_din,
 output reg [3:0] parallel_out,
 output  s_left_dout,
 output  s_right_dout

    );
    
    always@(posedge clk)begin
    if(!rst_n) parallel_out=0;
    else begin
    case(select) 
    2'h1:parallel_out<={s_right_din, parallel_out[3:0]};
    2'h2:parallel_out<={ parallel_out[3:0], s_left_din};
    2'h3:parallel_out<= parallel_in;
    default: parallel_out<=parallel_out;
    endcase
    end
    end
    assign s_left_dout = parallel_out[0];
    assign s_right_dout = parallel_out[3];
endmodule
