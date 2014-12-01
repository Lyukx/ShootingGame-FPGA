`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:15 12/25/2013 
// Design Name: 
// Module Name:    clk_10 
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
module clk_10(clk_1ms,clk_10ms);
input clk_1ms;
output clk_10ms;
reg [3:0]cnter;
reg c10ms;

initial
	cnter[3:0]<=0;

always@(posedge clk_1ms) begin
	if(cnter[3:0]==4'b1010) begin
		cnter[3:0]<=0;
		c10ms<=1;
	end
	else if(cnter[3:0]<4'b1010) begin
		cnter[3:0]<=cnter[3:0]+4'b0001;
		c10ms<=0;
	end
end

assign clk_10ms=c10ms;

endmodule
