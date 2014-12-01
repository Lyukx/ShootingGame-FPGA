`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:37 02/09/2014 
// Design Name: 
// Module Name:    vga_RGB 
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
module vga_RGB(
	input video_out,
//	input gameover,
	input gameclear,
	input clk,
	input clk_100ms,
	input clk_1s,//需要用到的时钟信号（主要用于小动画演示）
	input [9:0]planex,
	input [9:0]planey,					//自机位置
	input [2:0]life,
	input [9:0]mybx,
	input [9:0]myby,						//自机子弹位置
	input	[9:0]bossx,
	input [9:0]bossy,
	input boss,				//BOSS位置与是否出现
	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,		//杂鱼位置
	input enma1,enma2,enma3,enma4,
	input	[9:0]bigbulletx1,
	input [9:0]bigbullety1,				//杂鱼子弹位置
	input	[9:0]bigbulletx2,
	input [9:0]bigbullety2,				//杂鱼子弹位置
	input [9:0]bulletx1,
	input [9:0]bullety1,
	input [9:0]bulletx2,
	input [9:0]bullety2,
	input [9:0]bulletx3,
	input [9:0]bullety3,
	input [9:0]bulletx4,
	input [9:0]bullety4,
	input [9:0]bulletx5,
	input [9:0]bullety5,
	input [9:0]bulletx6,
	input [9:0]bullety6,
	input [9:0]bulletx7,
	input [9:0]bullety7,
	input [9:0]bulletx8,
	input [9:0]bullety8,
	input [9:0]bulletx9,
	input [9:0]bullety9,
	input [9:0]bulletx10,
	input [9:0]bullety10,
	input [9:0]bulletx11,
	input [9:0]bullety11,
	input [9:0]bulletx12,
	input [9:0]bullety12,
	input [9:0]hc,
	input [9:0]vc,
	output reg [2:0]vgaRed,
	output reg [2:0]vgaGreen,
	output reg [1:0]vgaBlue);

reg [2:0]m;
reg [2:0]n;
//------------调用块ROM存储的图像
reg [12:0]adrgl;//---------------游戏logo“SHOOTING GAME”【249*27】
wire [7:0]Dgl;
gamelogo i0(clk,adrgl,Dgl);

reg [12:0]adrbb;//---------------大型子弹【76*76】
wire [7:0]Dbb;
bigbullet i1(clk,adrbb,Dbb);

reg [12:0]adrbg1;//--------------背景差分1【80*80】
wire [7:0]Dbg1;
bg1 i2(clk,adrbg1,Dbg1);

reg [12:0]adrbg2;//--------------背景差分2【80*80】
wire [7:0]Dbg2;
bg2 i3(clk,adrbg2,Dbg2);

reg [10:0]adrmyp;//--------------自机差分【30*37】
wire [7:0]Dmyp1;
wire [7:0]Dmyp2;
mypl1 i5(clk,adrmyp,Dmyp1);
mypl2 i6(clk,adrmyp,Dmyp2);

reg [8:0]adrmb;//----------------自机子弹【17*27】
wire [7:0]Dmb;
mybullet i7(clk,adrmb,Dmb);

reg [8:0]adrlb;//----------------小型子弹【18*18】
wire [7:0]Dlb;
littlebullet i8(clk,adrlb,Dlb);

reg [9:0]adrlfl;//---------------生命计数logo【52*18】
wire [7:0]Dlfl;
lifelogo i9(clk,adrlfl,Dlfl);

reg [8:0]adrlf;//----------------生命计数图形（五角星）【22*21】
wire [7:0]Dlf;
life i10(clk,adrlf,Dlf);

reg [10:0]adrenm;//--------------杂鱼差分【30*37】
wire [7:0]Denm1;
wire [7:0]Denm2;
enm1 i11(clk,adrenm,Denm1);
enm2 i12(clk,adrenm,Denm2);

reg [14:0]adrboss;//-------------boss【216*110】
wire [7:0]Dboss;
boss i14(clk,adrboss,Dboss);
/*
reg [11:0]adrgol;
wire Dgol;
gameoverlogo i15(clk,adrgol,Dgol);
*/
reg [13:0]adrgcl;
wire Dgcl;
gameclearlogo i16(clk,adrgcl,Dgcl);

always begin
	if((hc<=bigbulletx1+38)&&(hc>bigbulletx1-38)&&(vc>bigbullety1-38)&&(vc<=bigbullety1+38))
		//hc-(bx-38)+76*(vc-(by-38))=hc+76*vc-bx-76*by+2926
		adrbb<=hc+76*vc-bigbulletx1-76*bigbullety1+2926;
	else if((hc<=bigbulletx2+38)&&(hc>bigbulletx2-38)&&(vc>bigbullety2-38)&&(vc<=bigbullety2+38))
		adrbb<=hc+76*vc-bigbulletx2-76*bigbullety2+2926;
	else
		adrbb<=0;
end

always begin
	if((hc<=bulletx1+9)&&(hc>bulletx1-9)&&(vc>bullety1-9)&&(vc<=bullety1+9))
		adrlb<=hc-bulletx1+9+18*(vc-bullety1+9);
	else if((hc<=bulletx2+9)&&(hc>bulletx2-9)&&(vc>bullety2-9)&&(vc<=bullety2+9))
		adrlb<=hc-bulletx2+9+18*(vc-bullety2+9);
	else if((hc<=bulletx3+9)&&(hc>bulletx3-9)&&(vc>bullety3-9)&&(vc<=bullety3+9))
		adrlb<=hc-bulletx3+9+18*(vc-bullety3+9);
	else if((hc<=bulletx4+9)&&(hc>bulletx4-9)&&(vc>bullety4-9)&&(vc<=bullety4+9))
		adrlb<=hc-bulletx4+9+18*(vc-bullety4+9);
	else if((hc<=bulletx5+9)&&(hc>bulletx5-9)&&(vc>bullety5-9)&&(vc<=bullety5+9))
		adrlb<=hc-bulletx5+9+18*(vc-bullety5+9);
	else if((hc<=bulletx6+9)&&(hc>bulletx6-9)&&(vc>bullety6-9)&&(vc<=bullety6+9))
		adrlb<=hc-bulletx6+9+18*(vc-bullety6+9);
	else if((hc<=bulletx7+9)&&(hc>bulletx7-9)&&(vc>bullety7-9)&&(vc<=bullety7+9))
		adrlb<=hc-bulletx7+9+18*(vc-bullety7+9);
	else if((hc<=bulletx8+9)&&(hc>bulletx8-9)&&(vc>bullety8-9)&&(vc<=bullety8+9))
		adrlb<=hc-bulletx8+9+18*(vc-bullety8+9);
	else if((hc<=bulletx9+9)&&(hc>bulletx9-9)&&(vc>bullety9-9)&&(vc<=bullety9+9))
		adrlb<=hc-bulletx9+9+18*(vc-bullety9+9);
	else if((hc<=bulletx10+9)&&(hc>bulletx10-9)&&(vc>bullety10-9)&&(vc<=bullety10+9))
		adrlb<=hc-bulletx10+9+18*(vc-bullety10+9);
	else if((hc<=bulletx11+9)&&(hc>bulletx11-9)&&(vc>bullety11-9)&&(vc<=bullety11+9))
		adrlb<=hc-bulletx11+9+18*(vc-bullety11+9);
	else if((hc<=bulletx12+9)&&(hc>bulletx12-9)&&(vc>bullety12-9)&&(vc<=bullety12+9))
		adrlb<=hc-bulletx12+9+18*(vc-bullety12+9);
	else
		adrlb<=0;
end

always begin
	if((hc<=planex+15)&&(hc>planex-15)&&(vc>=planey-19)&&(vc<planey+18))
		adrmyp<=hc-planex+15+(vc-planey+19)*30;
	else
		adrmyp<=0;
end

always begin
	if((hc<=mybx+8)&&(hc>=mybx-8)&&(vc>=myby-13)&&(vc<=myby+13))
		adrmb<=hc-mybx+8+(vc-myby+13)*17;
	else
		adrmb<=0;
end

always begin
	if((hc<bossx+108)&&(hc>=bossx-108)&&(vc>=bossy-55)&&(vc<bossy+55))
		adrboss<=hc-bossx+108+(vc-bossy+55)*216;
	else
		adrboss<=0;
end

always begin
	if((hc<=enmx1+15)&&(hc>=enmx1-15)&&(vc>=enmy1-19)&&(vc<enmy1+18))
		adrenm<=hc-enmx1+15+(vc-enmy1+19)*30;
	else if((hc<=enmx2+15)&&(hc>=enmx2-15)&&(vc>=enmy2-19)&&(vc<enmy2+18))
		adrenm<=hc-enmx2+15+(vc-enmy2+19)*30;
	else if((hc<=enmx3+15)&&(hc>=enmx3-15)&&(vc>=enmy3-19)&&(vc<enmy3+18))
		adrenm<=hc-enmx3+15+(vc-enmy3+19)*30;
	else if((hc<=enmx4+15)&&(hc>=enmx4-15)&&(vc>=enmy4-19)&&(vc<enmy4+18))
		adrenm<=hc-enmx4+15+(vc-enmy4+19)*30;
	else
		adrenm<=0;
end

//------------在游戏背景处计算填充样式
always begin
	if(vc>=71)begin
		if(vc<=150)	m<=0;
		else if(vc<=230)	m<=1;
		else if(vc<=310)	m<=2;
		else if(vc<=390)	m<=3;
		else if(vc<=470)	m<=4;
	end
end

always begin
	if(hc>=184)begin
		if(hc<=263)	n<=0;
		else if(hc<=344)	n<=1;
		else if(hc<=424)	n<=2;
		else if(hc<=504)	n<=3;
	end
end

//----------------贴图部分	
always@(posedge clk)begin
	if(!video_out) begin
		vgaRed[2:0]<=3'b000;
		vgaGreen[2:0]<=3'b000;
		vgaBlue[1:0]<=2'b00;
	end
	else begin
		if(gameclear&&(hc>244)&&(hc<=444)&&(vc>171)&&(vc<=371))begin
			if((hc>249)&&(hc<=439)&&(vc>248)&&(vc<=293))begin
				adrgcl<=hc-249+(vc-248)*190;
				{vgaRed,vgaGreen,vgaBlue}<={Dgcl,Dgcl,Dgcl,Dgcl,Dgcl,Dgcl,Dgcl,Dgcl};
			end
			else
				{vgaRed,vgaGreen,vgaBlue}<=8'b00000000;
		end
				
		else 
		if((hc<=184)||(hc>=504)||(vc<=71)||(vc>=471))begin
			if((hc>=516)&&(hc<765)&&(vc>=71)&&(vc<98))begin//游戏LOGO"SHOOTING GAME"
				adrgl<=hc-516+(vc-71)*249;
				{vgaRed,vgaGreen,vgaBlue}<=Dgl;
			end
			
			else if((hc>=516)&&(hc<568)&&(vc>=196)&&(vc<214))begin//生命计数logo"LIFE"
				adrlfl<=hc-516+(vc-196)*52;
				{vgaRed,vgaGreen,vgaBlue}<=Dlfl;
			end
			
			else if((hc>=516)&&(hc<538)&&(vc>=224)&&(vc<245)&&life[2])begin//生命填充图形（五角星）
				adrlf<=hc-516+(vc-224)*22;
				{vgaRed,vgaGreen,vgaBlue}<=Dlf;
			end			
			else if((hc>=538)&&(hc<560)&&(vc>=224)&&(vc<245)&&life[1])begin
					adrlf<=hc-538+(vc-224)*22;
					{vgaRed,vgaGreen,vgaBlue}<=Dlf;
			end
			else if((hc>=560)&&(hc<582)&&(vc>=224)&&(vc<245)&&life[0])begin
					adrlf<=hc-560+(vc-224)*22;
					{vgaRed,vgaGreen,vgaBlue}<=Dlf;
			end
			
			else
			{vgaRed,vgaGreen,vgaBlue}<=8'b10010010;//其他部分设定为灰色
		end
				
		else if((Dmyp1!=8'b00000000)&&(clk_100ms))//自机差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Dmyp1;		
		else if((Dmyp2!=8'b00000000)&&(!clk_100ms))//自机差分2贴图
			{vgaRed,vgaGreen,vgaBlue}<=Dmyp2;
			
		else if((Denm1!=8'b00000000)&&(clk_100ms)&&(enma1))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm1;
		else if((Denm2!=8'b00000000)&&(!clk_100ms)&&(enma1))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm2;
		else if((Denm1!=8'b00000000)&&(clk_100ms)&&(enma2))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm1;
		else if((Denm2!=8'b00000000)&&(!clk_100ms)&&(enma2))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm2;
		else if((Denm1!=8'b00000000)&&(clk_100ms)&&(enma3))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm1;
		else if((Denm2!=8'b00000000)&&(!clk_100ms)&&(enma3))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm2;
		else if((Denm1!=8'b00000000)&&(clk_100ms)&&(enma4))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm1;
		else if((Denm2!=8'b00000000)&&(!clk_100ms)&&(enma4))//杂鱼差分1贴图
			{vgaRed,vgaGreen,vgaBlue}<=Denm2;
		
		else if((Dboss!=8'b00000000)&&boss)//boss贴图
			{vgaRed,vgaGreen,vgaBlue}<=Dboss;
			
		else if(Dbb!=8'b00000000)//大型子弹贴图
			{vgaRed,vgaGreen,vgaBlue}<=Dbb;
			
		else if(Dlb!=8'b00000000)
			{vgaRed,vgaGreen,vgaBlue}<=Dlb;
		
		else if(Dmb!=8'b00000000)//自机子弹贴图
			{vgaRed,vgaGreen,vgaBlue}<=Dmb;
				
		else begin
			//(hc-184-80*n)+80*(vc-71-80*m)=hc+80*vc-6400*m-80*n-5864
			//adrbg1<=hc+80*vc-6400*m-80*n-5864;
			//adrbg2<=hc+80*vc-6400*m-80*n-5864;
			case(clk_1s)
				1'b1:adrbg1<=hc+80*vc-6400*m-80*n-5864;//{vgaRed,vgaGreen,vgaBlue}<=Dbg1;
				default:adrbg1<=80*vc-hc-6400*m-80*n-5417;//{vgaRed,vgaGreen,vgaBlue}<=Dbg2;
			endcase
			{vgaRed,vgaGreen,vgaBlue}<=Dbg1;
		end
		
	end
end
	
endmodule
