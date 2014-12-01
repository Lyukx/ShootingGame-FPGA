`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:56 02/09/2014 
// Design Name: 
// Module Name:    Input 
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
module Input(PS2C,PS2D,clk25,state);

input PS2C;
input PS2D;
input clk25;
output reg [3:0]state;

wire [15:0]xkey;

initial state<=0;

keyboard(clk25,1'b0,PS2C,PS2D,xkey);

always begin
	if((xkey[7:4]==4'hf)&&(xkey[3:0]==4'h0))				//第一位是f0，即松键
		state<=0;
	else if((xkey[15:12]==4'h1)&&(xkey[11:8]==4'hd))	//W
		state[0]<=1;
	else if((xkey[15:12]==4'h1)&&(xkey[11:8]==4'hc))	//A
		state[1]<=1;
	else if((xkey[15:12]==4'h2)&&(xkey[11:8]==4'h3))	//S
		state[2]<=1;
	else if((xkey[15:12]==4'h1)&&(xkey[11:8]==4'hb))	//D
		state[3]<=1;
	else																//无效输入
		state<=0;
end
endmodule
