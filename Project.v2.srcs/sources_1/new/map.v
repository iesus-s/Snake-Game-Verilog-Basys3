`timescale 1ns / 1ps

module map(input clk, clk_25, clk_game, rst, en, input [9:0] xx, yy, output reg hsync, vsync, output [11:0] pixel, output checkaroo);

reg [9:0] h_counter = 0;
reg [9:0] v_counter = 0;
reg [11:0] pixel_holder;
reg [11:0] area [0:240][0:320];
reg [31:0] map_counter = 0;
integer i, j;
reg [2:0] step;
reg [11:0] snake = 12'h00F;
reg [9:0] d_x = 160;
reg [9:0] d_y = 120;
reg help = 0;

reg [11:0] map_l_x, map_r_x, map_u_y, map_d_y;

reg [9:0] f_xx;
reg [9:0] f_yy;
reg [9:0] f_x = 0;
reg [9:0] f_y = 0;
reg food = 1;
reg [9:0] wall_counter = 0;
reg food_done = 0;

parameter blue = 12'h00F;

// CREATE MAP BORDER //
initial begin 
    for ( i = 0; i <= 240; i = i+1 ) begin
        for ( j = 0; j <= 320; j = j+1 ) begin
            if ( i < 10 && j <= 320 ) 
                area [i][j] <= 12'h00F;
            else if ( i >= 230 && j <= 320 ) begin
                area [i][j] <= 12'h00F;
            end
            else if ( j <= 10 || j >= 310 ) begin
                area [i][j] <= 12'h00F;
            end
            else
                area [i][j] <= 12'h000;
        end
    end
end

// CREATES RANDOM FOOD COORDINATE //
always @( posedge clk ) begin 
    if ( food ) begin 
        f_x <= f_x + 55;
        f_y <= f_x + 33;
        food <= 0;
    end  
    else if ( f_x < 11 || f_x > 319 ) begin
        f_x <= f_x + 20 ;
    end
    else if ( f_y < 11 || f_y > 229 ) begin
        f_y <= f_y + 20;
    end
    else if ( ( d_x+3 > f_x && d_x-3 < f_x && d_y+3 > f_y && d_y-3 < f_y ) ) begin
        food <= 1;
    end
end

// DISPLAYS THE BLOCK MEMORY //
always @( posedge clk ) begin
    d_x <= xx;
    d_y <= yy;
    if ( d_x-3 < 11 || d_x+3 > 319 || d_y < 11 || d_y > 229 ) begin
        step <= 3'b100;
    end
    else if ( ( h_counter > f_x-3 && h_counter < f_x+3 ) && ( v_counter > f_y-4 && v_counter < f_y+4 ) ) 
        step <= 3'b010;
    else if ( ( h_counter > d_x-3 && h_counter < d_x+3 ) && ( v_counter > d_y-4 && v_counter < d_y+4 ) ) 
        step <= 3'b000;
    else if ( v_counter < 240 && h_counter < 320 )
        step <= 3'b001;
    else 
        step <= 3'b011;
end

always @( posedge clk_25 ) begin 
    case ( step )
    3'b000: begin 
        pixel_holder <= snake;
        help <= 1'b0;
    end
    3'b001: begin
        pixel_holder <= area [v_counter][h_counter];
        help <= 1'b0;
    end
    3'b010: begin 
        pixel_holder <= 12'h5F4;
        help <= 1'b0;
    end
    3'b011: begin 
        pixel_holder <= 12'h000;
        help <= 1'b0;
    end
    3'b100: begin 
        pixel_holder <= 12'h000;
        help <= 1'b1;
    end
    endcase  
end
        
// LOGIC FOR VGA TIMING //
always @( posedge clk_25 ) begin 
    if ( en ) begin
        if ( h_counter == 799 ) begin 
            h_counter <= 0;
            if ( v_counter == 524 )  
                v_counter <= 0;
            else 
                v_counter <= v_counter + 1;
            end
        else 
            h_counter <= h_counter + 1;
            
    if ( v_counter >= 490 && v_counter < 492 ) 
        vsync <= 1'b0;
    else 
        vsync <= 1'b1;
        
    if ( h_counter >= 656 && h_counter < 752 )
        hsync <= 1'b0;
    else 
        hsync <= 1'b1;
    end
end

assign pixel = pixel_holder;
assign check_v = v_counter;
assign check_h = h_counter;
assign checkaroo = help;

endmodule
