`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:00:30 12/25/2013 
// Design Name: 
// Module Name:    clk_25 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_25(clk,clk25
    );
input wire clk;
output reg clk25;
reg clk50;
initial begin
clk50 = 0;
clk25 = 0;
end

always @(posedge clk) begin
	clk50 <= ~clk50;
end

always @(posedge clk50) begin
	clk25 <= ~ clk25;
end

endmodule
