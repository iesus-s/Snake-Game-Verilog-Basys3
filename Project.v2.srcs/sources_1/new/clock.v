`timescale 1ns / 1ps

module clock(input clk, output clk25, output clk_game);
reg [2:0] counter = 0;
reg [31:0] counter_1 = 0;
reg start = 0;
reg start_1 = 0;

always @( posedge clk ) begin 
    if ( counter == 1 || counter == 3 ) begin
        start <= start + 1;
        counter <= 0;
    end
    else 
        counter <= counter + 1;
end

always @( posedge clk ) begin 
    if ( counter_1 == 4_500_000 ) begin
        start_1 <= start_1 + 1;
        counter_1 <= 0;
    end
    else 
        counter_1 <= counter_1 + 1'b1;
end

assign clk25 = start;
assign clk_game = start_1;

endmodule
