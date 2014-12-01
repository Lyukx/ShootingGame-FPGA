`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:00 02/09/2014 
// Design Name: 
// Module Name:    boss 
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
module bossp(clk,enma1,enma2,enma3,enma4,bosshp,bossx,bossy,boss);
//BOSS图像大小：216*110
input clk;
input enma1;
input enma2;
input enma3;
input enma4;
input [9:0]bosshp;
output reg [9:0]bossx;
output reg [9:0]bossy;
output reg boss;

wire enma;
assign enma=enma1|enma2|enma3|enma4;//enma=0表示杂鱼全歼

always begin
	if((bosshp>0)&&(!enma))
		boss<=1;
	else
		boss<=0;
end

initial begin
	bossy<=166;
	bossx<=0;
end

always@(posedge clk)begin
	if(boss)begin
		if(bossx<344)
			bossx<=bossx+1;
		else
			bossx<=344;
	end
	else
		bossx<=0;
end
endmodule
