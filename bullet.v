`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:33 02/09/2014 
// Design Name: 
// Module Name:    bullet 
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
module bullet(
	input clk,
	input [9:0]planex,
	input [9:0]planey,
	input [9:0]enmx1,
	input [9:0]enmy1,
	input [9:0]enmx2,
	input [9:0]enmy2,
	input [9:0]enmx3,
	input [9:0]enmy3,
	input [9:0]enmx4,
	input [9:0]enmy4,
	input [6:0]enmhp1,
	input [6:0]enmhp2,
	input [6:0]enmhp3,
	input [6:0]enmhp4,
	input [9:0]bossx,
	input [9:0]bossy,
	input boss,
	input switch,
	output shot,
	output reg [9:0]bigbulletx1,
	output reg [9:0]bigbullety1,
	output reg [9:0]bigbulletx2,
	output reg [9:0]bigbullety2,
	output reg [9:0]bulletx1,
	output reg [9:0]bullety1,
	output reg [9:0]bulletx2,
	output reg [9:0]bullety2,
	output reg [9:0]bulletx3,
	output reg [9:0]bullety3,
	output reg [9:0]bulletx4,
	output reg [9:0]bullety4,
	output reg [9:0]bulletx5,
	output reg [9:0]bullety5,
	output reg [9:0]bulletx6,
	output reg [9:0]bullety6,
	output reg [9:0]bulletx7,
	output reg [9:0]bullety7,
	output reg [9:0]bulletx8,
	output reg [9:0]bullety8,
	output reg [9:0]bulletx9,
	output reg [9:0]bullety9,
	output reg [9:0]bulletx10,
	output reg [9:0]bullety10,
	output reg [9:0]bulletx11,
	output reg [9:0]bullety11,
	output reg [9:0]bulletx12,
	output reg [9:0]bullety12);

reg shot1,shot2,shot3,shot4,shot5,shot6,shot7,shot8,shot9,shot10,shot11,shot12,shot13,shot14;

assign shot=shot1|shot2|shot3|shot4|shot5|shot6|shot7|shot8|shot9|shot10|shot11|shot12|shot13|shot14;

initial begin
	{shot1,shot2,shot3,shot4,shot5,shot6,shot7,shot8,shot9,shot10,shot11,shot12,shot13,shot14}=14'b000000000000000;
end

reg [6:0]fst;
reg [4:0]counter30;
initial begin
	fst<=7'b1111111;
	counter30<=0;
end
always@(posedge clk)begin
	if(switch)begin
		fst<=7'b1111111;
		counter30<=0;
	end
	else begin
		if(boss)begin
			if(counter30>=30)begin
				counter30<=0;
				fst<=fst<<1;
			end
			else
				counter30<=counter30+1;
		end
		else counter30<=0;
	end
end

//´óÐÍ×Óµ¯1¿ØÖÆ
always@(posedge clk)begin
	if((bigbulletx1>planex-25)&&(bigbulletx1<planex+25)&&(bigbullety1<planey+25)&&(bigbullety1>planey-25))
		shot13<=1;
	else
		shot13<=0;
end
always@(posedge clk)begin
	if(boss&&(!switch))begin
		if((bigbulletx1<184)||(bigbulletx1>504)||(bigbullety1<61)||(bigbullety1>471))begin
			bigbulletx1<=260;
			bigbullety1<=190;
		end
		else begin
	//		bigbulletx1<=bigbulletx1+1;
			bigbullety1<=bigbullety1+1;
		end
	end
	else begin
		bigbulletx1<=0;
		bigbullety1<=0;
	end
end
	

//´óÐÍ×Óµ¯2¿ØÖÆ
always@(posedge clk)begin
	if((bigbulletx2>planex-25)&&(bigbulletx2<planex+25)&&(bigbullety2<planey+25)&&(bigbullety2>planey-25))
		shot14<=1;
	else
		shot14<=0;
end
always@(posedge clk)begin
	if(boss&&(!switch))begin
		if((bigbulletx2<184)||(bigbulletx2>504)||(bigbullety2<61)||(bigbullety2>471))begin
			bigbulletx2<=428;
			bigbullety2<=190;
		end
		else begin
		//	bigbulletx2<=bigbulletx2+1;
			bigbullety2<=bigbullety2+1;
		end
	end
	else begin
		bigbulletx2<=0;
		bigbullety2<=0;
	end
end

//-----------------------×Óµ¯1¿ØÖÆ(Ö±µ¯£¬ÔÓÓã1)
always@(posedge clk)begin
	if((bulletx1>planex-6)&&(bulletx1<planex+6)&&(bullety1<planey+6)&&(bullety1>planey-6))
		shot1<=1;
	else
		shot1<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx1<184)||(bulletx1>504)||(bullety1<61)||(bullety1>471)||switch)begin
			bulletx1<=enmx1;
			bullety1<=enmy1;
		end
		else if((enmhp1>80)||(0<enmhp1<40))
			bullety1<=bullety1+1;
		else
			bullety1<=bullety1;
	end
	else begin
		if(fst[0]) begin
			bulletx1<=294;
			bullety1<=221;
		end
		else begin
			if((bulletx1<184)||(bulletx1>504)||(bullety1<61)||(bullety1>471))begin
				bulletx1<=294;
				bullety1<=221;
			end
			else
				bullety1<=bullety1+1;
		end
	end
end


//-----------------------×Óµ¯2¿ØÖÆ£¨Ö±µ¯£¬ÔÓÓã2£©
always@(posedge clk)begin
	if((bulletx2>planex-6)&&(bulletx2<planex+6)&&(bullety2<planey+6)&&(bullety2>planey-6))
		shot2<=1;
	else
		shot2<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx2<184)||(bulletx2>504)||(bullety2<61)||(bullety2>471)||switch)begin
			bulletx2<=enmx2;
			bullety2<=enmy2;
		end
		else if((enmhp2>80)||(0<enmhp2<40))
			bullety2<=bullety2+1;
		else
			bullety2<=bullety2;
	end
	else begin
		if(fst[1]) begin
			bulletx2<=344;
			bullety2<=221;
		end
		else begin
			if((bulletx2<184)||(bulletx2>504)||(bullety2<61)||(bullety2>471))begin
				bulletx2<=344;
				bullety2<=221;
			end
			else
				bullety2<=bullety2+1;
		end
	end
end


//----------------------×Óµ¯3¿ØÖÆ£¨Ö±µ¯£¬ÔÓÓã3£©
always@(posedge clk)begin
	if((bulletx3>planex-6)&&(bulletx3<planex+6)&&(bullety3<planey+6)&&(bullety3>planey-6))
		shot3<=1;
	else
		shot3<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx3<184)||(bulletx3>504)||(bullety3<61)||(bullety3>471)||switch)begin
			bulletx3<=enmx3;
			bullety3<=enmy3;
		end
		else if((enmhp3>80)||(0<enmhp3<40))
			bullety3<=bullety3+1;
		else
			bullety3<=bullety3;
	end
	else begin
		if(fst[2])begin
			bulletx3<=394;
			bullety3<=221;
		end
		else begin
			if((bulletx3<184)||(bulletx3>504)||(bullety3<61)||(bullety3>471))begin
				bulletx3<=394;
				bullety3<=221;
			end
			else
				bullety3<=bullety3+1;
		end
	end
end



//----------------------×Óµ¯4¿ØÖÆ£¨Ö±µ¯£¬ÔÓÓã4£©
always@(posedge clk)begin
	if((bulletx4>planex-6)&&(bulletx4<planex+6)&&(bullety4<planey+6)&&(bullety4>planey-6))
		shot4<=1;
	else
		shot4<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx4<184)||(bulletx4>504)||(bullety4<61)||(bullety4>471)||switch)begin
			bulletx4<=enmx4;
			bullety4<=enmy4;
		end
		else if((enmhp4>80)||(0<enmhp4<40))
			bullety4<=bullety4+1;
		else
			bullety4<=bullety4;
	end
	else begin
		if(fst[3])begin
			bulletx4<=419;
			bullety4<=221;
		end
		else begin
			if((bulletx4<184)||(bulletx4>504)||(bullety4<61)||(bullety4>471))begin
				bulletx4<=419;
				bullety4<=221;
			end
			else
				bullety4<=bullety4+1;
		end
	end
end

//---------------------×Óµ¯5¿ØÖÆ£¨ÓÒÐ±µ¯£¬ÔÓÓã1£©	
always@(posedge clk)begin
	if((bulletx5>planex-6)&&(bulletx5<planex+6)&&(bullety5<planey+6)&&(bullety5>planey-6))
		shot5<=1;
	else
		shot5<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx5<184)||(bulletx5>504)||(bullety5<61)||(bullety5>471)||switch)begin
			bulletx5<=enmx1;
			bullety5<=enmy1;
		end
		else if(enmhp1<=80)begin
			bulletx5<=bulletx5+1;
			bullety5<=bullety5+1;
		end
		else begin
			bulletx5<=bulletx5;
			bullety5<=bullety5;
		end
	end
	else begin
		if(fst[4])begin
			bulletx5<=369;
			bullety5<=221;
		end
		else begin
			if((bulletx5<184)||(bulletx5>504)||(bullety5<61)||(bullety5>471))begin
				bulletx5<=369;
				bullety5<=221;
			end
			else
				bullety5<=bullety5+1;
		end
	end
end

//---------------------×Óµ¯6¿ØÖÆ£¨ÓÒÐ±µ¯£¬ÔÓÓã2£©
always@(posedge clk)begin
	if((bulletx6>planex-6)&&(bulletx6<planex+6)&&(bullety6<planey+6)&&(bullety6>planey-6))
		shot6<=1;
	else
		shot6<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx6<184)||(bulletx6>504)||(bullety6<61)||(bullety6>471)||switch)begin
			bulletx6<=enmx2;
			bullety6<=enmy2;
		end
		else if(enmhp2<=80)begin
			bulletx6<=bulletx6+1;
			bullety6<=bullety6+1;
		end
		else begin
			bulletx6<=bulletx6;
			bullety6<=bullety6;
		end
	end
	else begin
		if(fst[5])begin
			bulletx6<=319;
			bullety6<=221;
		end
		else begin
			if((bulletx6<184)||(bulletx6>504)||(bullety6<61)||(bullety6>471))begin
				bulletx6<=319;
				bullety6<=221;
			end
			else
				bullety6<=bullety6+1;
		end
	end
end

//---------------------×Óµ¯7¿ØÖÆ£¨ÓÒÐ±µ¯£¬ÔÓÓã3£©
always@(posedge clk)begin
	if((bulletx7>planex-6)&&(bulletx7<planex+6)&&(bullety7<planey+6)&&(bullety7>planey-6))
		shot7<=1;
	else
		shot7<=0;
end
always@(posedge clk)begin
	if(!boss)begin
		if((bulletx7<184)||(bulletx7>504)||(bullety7<61)||(bullety7>471)||switch)begin
			bulletx7<=enmx3;
			bullety7<=enmy3;
		end
		else if(enmhp3<=80)begin
			bulletx7<=bulletx7+1;
			bullety7<=bullety7+1;
		end
		else begin
			bulletx7<=bulletx7;
			bullety7<=bullety7;
		end
	end
	else begin
		if(fst[6])begin
			bulletx7<=269;
			bullety7<=221;
		end
		else begin
			if((bulletx7<184)||(bulletx7>504)||(bullety7<61)||(bullety7>471))begin
				bulletx7<=269;
				bullety7<=221;
			end
			else
				bullety7<=bullety7+1;
		end
	end
end

//--------------------×Óµ¯8¿ØÖÆ£¨ÓÒÐ±µ¯£¬ÔÓÓã4£©
always@(posedge clk)begin
	if((bulletx8>planex-6)&&(bulletx8<planex+6)&&(bullety8<planey+6)&&(bullety8>planey-6))
		shot8<=1;
	else
		shot8<=0;
end
always@(posedge clk)begin
	if((bulletx8<184)||(bulletx8>504)||(bullety8<61)||(bullety8>471)||switch)begin
		bulletx8<=enmx4;
		bullety8<=enmy4;
	end
	else if(enmhp4<=80)begin
		bulletx8<=bulletx8+1;
		bullety8<=bullety8+1;
	end
	else begin
		bulletx8<=bulletx8;
		bullety8<=bullety8;
	end
end

//--------------------×Óµ¯9¿ØÖÆ£¨×óÐ±µ¯£¬ÔÓÓã1£©
always@(posedge clk)begin
	if((bulletx9>planex-6)&&(bulletx9<planex+6)&&(bullety9<planey+6)&&(bullety9>planey-6))
		shot9<=1;
	else
		shot9<=0;
end
always@(posedge clk)begin
	if(((bulletx9<184)||(bulletx9>504)||(bullety9<61)||(bullety9>471)||switch)&&(enmhp1<=80))begin
		bulletx9<=enmx1;
		bullety9<=enmy1;
	end
	else begin
		bulletx9<=bulletx9-1;
		bullety9<=bullety9+1;
	end
end

//--------------------×Óµ¯10¿ØÖÆ£¨×óÐ±µ¯£¬ÔÓÓã2£©
always@(posedge clk)begin
	if((bulletx10>planex-6)&&(bulletx10<planex+6)&&(bullety10<planey+6)&&(bullety10>planey-6))
		shot10<=1;
	else
		shot10<=0;
end
always@(posedge clk)begin
	if(((bulletx10<184)||(bulletx10>504)||(bullety10<61)||(bullety10>471)||switch)&&(enmhp2<=80))begin
		bulletx10<=enmx2;
		bullety10<=enmy2;
	end
	else begin
		bulletx10<=bulletx10-1;
		bullety10<=bullety10+1;
	end
end

//-------------------×Óµ¯11¿ØÖÆ£¨×óÐ±µ¯£¬ÔÓÓã3£©
always@(posedge clk)begin
	if((bulletx11>planex-6)&&(bulletx11<planex+6)&&(bullety11<planey+6)&&(bullety11>planey-6))
		shot11<=1;
	else
		shot11<=0;
end
always@(posedge clk)begin
	if(((bulletx11<184)||(bulletx11>504)||(bullety11<61)||(bullety11>471)||switch)&&(enmhp3<=80))begin
		bulletx11<=enmx3;
		bullety11<=enmy3;
	end
	else begin
		bulletx11<=bulletx11-1;
		bullety11<=bullety11+1;
	end
end

//--------------------×Óµ¯12¿ØÖÆ
always@(posedge clk)begin
	if((bulletx12>planex-6)&&(bulletx12<planex+6)&&(bullety12<planey+6)&&(bullety12>planey-6))
		shot12<=1;
	else
		shot12<=0;
end
always@(posedge clk)begin
	if(((bulletx12<184)||(bulletx12>504)||(bullety12<61)||(bullety12>471)||switch)&&(enmhp4<=80))begin
		bulletx12<=enmx4;
		bullety12<=enmy4;
	end
	else begin
		bulletx12<=bulletx12-1;
		bullety12<=bullety12+1;
	end
end

endmodule
