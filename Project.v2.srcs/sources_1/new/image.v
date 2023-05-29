`timescale 1ns / 1ps

module image(input clk, rst, en, left, right, up, down, output [11:0] pixel, output hsync, vsync);

wire clk_25, wire_w;
wire [9:0] dx, dy;
wire [9:0] foop_v, foop_h;

clock test (.clk(clk), .clk25(clk_25), .clk_game(clk_game));

map   best (.clk(clk), .clk_25(clk_25), .clk_game(clk_game), .rst(rst), .en(en), .hsync(hsync), .vsync(vsync), 
            .xx(dx), .yy(dy), .pixel(pixel), .checkaroo(wire_w));

controls t (.clk(clk_game), .left(left), .right(right), .up(up), .down(down), .x(dx), .y(dy), .bloop(wire_w));

endmodule
