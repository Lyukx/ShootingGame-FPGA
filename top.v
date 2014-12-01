`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:36 02/09/2014 
// Design Name: 
// Module Name:    top 
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
module top(clk,PS2C,PS2D,switch,hsync,vsync,vgaRed,vgaGreen,vgaBlue
    );
input clk;
input PS2C;
input PS2D;
input switch;
output hsync;
output vsync;
output [2:0]vgaRed;
output [2:0]vgaGreen;
output [1:0]vgaBlue;
//----------------------------------------------------------
wire [3:0]btnstate;
wire clk_1ms;
wire [25:0]count_out;
wire [9:0]hc;
wire [9:0]vc;
//---------------位置信息等
wire [9:0]planex;
wire [9:0]planey;					//自机位置
wire [9:0]mybx;
wire [9:0]myby;					//自机子弹位置
wire [9:0]bossx;
wire [9:0]bossy;
wire boss;							//BOSS位置与是否出现
wire [9:0]enmx1;
wire [9:0]enmy1;
wire [9:0]enmx2;
wire [9:0]enmy2;
wire [9:0]enmx3;
wire [9:0]enmy3;
wire [9:0]enmx4;
wire [9:0]enmy4;					//杂鱼位置
wire [9:0]bigbulletx1;
wire [9:0]bigbullety1;			//杂鱼子弹位置
wire [9:0]bigbulletx2;
wire [9:0]bigbullety2;
wire [9:0]bulletx1;
wire [9:0]bullety1;
wire [9:0]bulletx2;
wire [9:0]bullety2;
wire [9:0]bulletx3;
wire [9:0]bullety3;
wire [9:0]bulletx4;
wire [9:0]bullety4;
wire [9:0]bulletx5;
wire [9:0]bullety5;
wire [9:0]bulletx6;
wire [9:0]bullety6;
wire [9:0]bulletx7;
wire [9:0]bullety7;
wire [9:0]bulletx8;
wire [9:0]bullety8;
wire [9:0]bulletx9;
wire [9:0]bullety9;
wire [9:0]bulletx10;
wire [9:0]bullety10;
wire [9:0]bulletx11;
wire [9:0]bullety11;
wire [9:0]bulletx12;
wire [9:0]bullety12;

wire [6:0]enmhp1;
wire [6:0]enmhp2;
wire [6:0]enmhp3;
wire [6:0]enmhp4;
wire [9:0]bosshp;
wire enma1,enma2,enma3,enma4;//杂鱼是否出现
reg [2:0]life;

//---------------自机生命控制（左移移位寄存器）
initial
	life<=3'b111;

always@(posedge shot or posedge switch)begin
	if(switch) life<=3'b111;
	else life<=life<<1;
end
//----------------游戏结束控制
reg gameover;
reg gameclear;

initial begin
	gameover<=0;
	gameclear<=0;
end
always begin
	if(switch)
		gameover<=0;
	else begin
		if(life==3'b000)
			gameover<=1;
		else
			gameover<=0;
	end
end
always begin
	if(switch)
		gameclear<=0;
	else begin
		if(bosshp==0)
			gameclear<=1;
		else
			gameclear<=0;
	end
end

//-----------------判断敌机是否被击落的信号

assign enma1=enmhp1[0]|enmhp1[1]|enmhp1[2]|enmhp1[3]|enmhp1[4]|enmhp1[5]|enmhp1[6];
assign enma2=enmhp2[0]|enmhp2[1]|enmhp2[2]|enmhp2[3]|enmhp2[4]|enmhp1[5]|enmhp1[6];
assign enma3=enmhp3[0]|enmhp3[1]|enmhp3[2]|enmhp3[3]|enmhp3[4]|enmhp1[5]|enmhp1[6];
assign enma4=enmhp4[0]|enmhp4[1]|enmhp4[2]|enmhp4[3]|enmhp4[4]|enmhp1[5]|enmhp1[6];

//----------------输入模块（调用PS/2）
Input m0(PS2C,PS2D,clk25,btnstate);

//----------------各种时钟分频模块
counter_26bit m1(clk,clk_1ms/*,count_out*/);
clk_10 c0(clk_1ms,clk_10ms);
clk_10 c1(clk_10ms,clk_100ms);
clk_1s c2(clk,clk_1s);
clk_25 c3(clk,clk25);

//----------------计算弹道和飞机位置模块
bossp m2(clk,enma1,enma2,enma3,enma4,bosshp,bossx,bossy,boss);

plane m4(clk_10ms,gameover,btnstate,planex,planey);

enm m5(clk_10ms,switch,
		enmhp1,enmhp2,enmhp3,enmhp4,
		planex,planey,
		enmx1,enmy1,
		enmx2,enmy2,
		enmx3,enmy3,
		enmx4,enmy4,
		enmrst);

bullet m6(clk_10ms,planex,planey,
			enmx1,enmy1,
			enmx2,enmy2,
			enmx3,enmy3,
			enmx4,enmy4,
			enmhp1,enmhp2,enmhp3,enmhp4,
			bossx,bossy,boss,switch,
			shot,
			bigbulletx1,bigbullety1,
			bigbulletx2,bigbullety2,
			bulletx1,bullety1,
			bulletx2,bullety2,
			bulletx3,bullety3,
			bulletx4,bullety4,
			bulletx5,bullety5,
			bulletx6,bullety6,
			bulletx7,bullety7,
			bulletx8,bullety8,
			bulletx9,bullety9,
			bulletx10,bullety10,
			bulletx11,bullety11,
			bulletx12,bullety12);

myb m3(clk_1ms,switch,mybx,myby,
			planex,planey,					//自机位置
			bossx,bossy,					//BOSS位置
			enmx1,enmy1,
			enmx2,enmy2,
			enmx3,enmy3,
			enmx4,enmy4,
			enmrst,
			enmhp1,enmhp2,enmhp3,enmhp4,bosshp
			);

vga_hcvc m7(clk25,hsync,vsync,hc,vc,video_out);

vga_RGB m8(video_out,gameclear,
			clk,clk_100ms,clk_1s,//需要用到的时钟信号（主要用于小动画演示）
			planex,planey,life,					//自机位置
			mybx,myby,						//自机子弹位置
			bossx,bossy,boss,				//BOSS位置与是否出现
			enmx1,enmy1,
			enmx2,enmy2,
			enmx3,enmy3,
			enmx4,enmy4,
			enma1,enma2,enma3,enma4,						//杂鱼位置
			bigbulletx1,bigbullety1,				//杂鱼子弹位置
			bigbulletx2,bigbullety2,
			bulletx1,bullety1,
			bulletx2,bullety2,
			bulletx3,bullety3,
			bulletx4,bullety4,
			bulletx5,bullety5,
			bulletx6,bullety6,
			bulletx7,bullety7,
			bulletx8,bullety8,
			bulletx9,bullety9,
			bulletx10,bullety10,
			bulletx11,bullety11,
			bulletx12,bullety12,
			hc,vc,vgaRed,vgaGreen,vgaBlue);

endmodule
