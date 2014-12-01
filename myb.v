`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:19 02/09/2014 
// Design Name: 
// Module Name:    myb 
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
module myb(
	input clk_1ms,
	input switch,
	output reg [9:0]mybx,
	output reg [9:0]myby,
	input [9:0]planex,
	input [9:0]planey,
	input [9:0]bossx,
	input [9:0]bossy,
	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,
	input enmrst,
	output reg [6:0]enmhp1,
	output reg [6:0]enmhp2,
	output reg [6:0]enmhp3,
	output reg [6:0]enmhp4,
	output reg [9:0]bosshp
			);

//-------------杂鱼和BOSS的血量


initial begin
	mybx<=planex;
	myby<=planey;
	bosshp<=600;
	enmhp1<=120;
	enmhp2<=120;
	enmhp3<=120;
	enmhp4<=120;
end

always@(posedge clk_1ms)begin
	if(switch)begin
		enmhp1<=120;
		enmhp2<=120;
		enmhp3<=120;
		enmhp4<=120;
		bosshp<=600;
	end
	else begin
		if(((mybx>=bossx-41)&&(mybx<=bossx+41)&&(myby<=bossy+24)))begin//打到BOSS
			mybx<=planex;
			myby<=planey;
			if(bosshp>0) bosshp<=bosshp-2;
			else bosshp<=0;
		end
			
		else if((mybx>enmx1-15)&&(mybx<enmx1+15)&&(myby<enmy1+18)&&(myby>enmy1-18))begin//打到杂鱼1
			mybx<=planex;
			myby<=planey;
			if(enmhp1>0) enmhp1<=enmhp1-5'b00010;
			else enmhp1<=0;
		end
		else if((mybx>enmx2-15)&&(mybx<enmx2+15)&&(myby<enmy2+18)&&(myby>enmy2-18))begin//打到杂鱼2
			mybx<=planex;
			myby<=planey;
			if(enmhp2>0) enmhp2<=enmhp2-5'b00010;
			else enmhp2<=0;
		end
		else if((mybx>enmx3-15)&&(mybx<enmx3+15)&&(myby<enmy3+18)&&(myby>enmy3-18))begin//打到杂鱼3
			mybx<=planex;
			myby<=planey;
			if(enmhp3>0) enmhp3<=enmhp3-5'b00010;
			else enmhp3<=0;
		end
		else if((mybx>enmx4-15)&&(mybx<enmx4+15)&&(myby<enmy4+18)&&(myby>enmy4-18))begin//打到杂鱼4
			mybx<=planex;
			myby<=planey;
			if(enmhp4>0) enmhp4<=enmhp4-5'b00010;
			else enmhp4<=0; 
		end
		
		else if(myby<=71)begin//超出判定域
			mybx<=planex;
			myby<=planey;
		end
	
		else
			myby<=myby-1;
	end
end

endmodule
