`timescale 1ns / 1ps

module tb;

reg clk;
reg rst;
reg en;
reg left;
reg right;

initial begin 
clk = 0;
rst = 0;
#20 rst = 1;
#40 rst = 0;
#100 en = 1;
#500 left = 1;
#550 left = 0;
#600 right = 1;
#650 right = 0;
end

always begin 
#5 clk = ~clk;
end

image tw (.clk(clk), .rst(rst), .en(en), .left(left), .right(right));
endmodule
