`timescale 1ns / 1ps

module controls(input clk, left, right, up, down, input bloop, output [9:0] x, y, output reg [2:0] step);

reg [2:0] moment = 3'b000;
reg [9:0] d_y = 120;
reg [9:0] d_x = 160;
reg [1:0] direction;

always @( posedge clk ) begin 
    if ( left ) begin 
        direction <= 2'b00;
    end
    else if ( right ) begin
        direction <= 2'b01;
    end
    else if ( up ) begin 
        direction <= 2'b10;
    end
    else if ( down ) begin 
        direction <= 2'b11;
    end
end

always @( posedge clk ) begin 
    if ( bloop ) begin 
        d_x <= 160;
        d_y <= 120;
    end
    else
    case ( direction ) 
    2'b00: begin 
        d_x <= d_x - 1;
    end
    2'b01: begin 
        d_x <= d_x + 1;
    end
    2'b10: begin 
        d_y <= d_y - 1;
    end
    2'b11: begin 
        d_y <= d_y + 1;
    end
    endcase
end      

assign x = d_x; 
assign y = d_y;    

endmodule
