`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:03 02/09/2014 
// Design Name: 
// Module Name:    enm 
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
module enm(
		input clk_10ms,
		input switch,
		input [6:0]enmhp1,
		input [6:0]enmhp2,
		input [6:0]enmhp3,
		input [6:0]enmhp4,
		input [9:0]planex,
		input [9:0]planey,
		output reg [9:0]enmx1,
		output reg [9:0]enmy1,
		output reg [9:0]enmx2,
		output reg [9:0]enmy2,
		output reg [9:0]enmx3,
		output reg [9:0]enmy3,
		output reg [9:0]enmx4,
		output reg [9:0]enmy4,
		output enmrst);

always@(posedge clk_10ms)begin
	if(switch)begin
		enmx1<=248;
		enmy1<=40;
	end
	else begin
		if(enmhp1>80)begin
			if(enmy1<200)enmy1<=enmy1+1;
			else enmy1<=200;
		end
		
		else if(enmhp1>40)begin
			if(enmx1<504)enmx1<=enmx1+1;
			else enmx1<=184;
		end
		
		else if(enmhp1==0)
			enmx1<=0;
		
		else begin
			if(enmx1<344)begin
				enmx1<=enmx1+1;
				enmy1<=enmx1+87;
			end
			else if(enmx1<504)begin
				enmx1<=enmx1+1;
				enmy1<=775-enmx1;
			end
			else begin
				enmx1<=184;
				enmy1<=271;
			end
		end
	end
end

always@(posedge clk_10ms)begin
	if(switch)begin
		enmx2<=312;
		enmy2<=40;
	end
	else begin
		if(enmhp2>80)begin
			if(enmy2<150)enmy2<=enmy2+1;
			else enmy2<=150;
		end
		
		else if(enmhp2>40)begin
			if(enmx2<504)enmx2<=enmx2+1;
			else enmx2<=184;
		end
		
		else if(enmhp2==0)
			enmx2<=0;
		
		else begin
			if(enmx2>344)begin
				enmx2<=enmx2-1;
				enmy2<=enmx2-233;
			end
			else if(enmx2>184)begin
				enmx2<=enmx2-1;
				enmy2<=455-enmx2;
			end
			else begin
				enmx2<=504;
				enmy2<=271;
			end
		end
	end
end

always@(posedge clk_10ms)begin
	if(switch)begin
		enmx3<=376;
		enmy3<=40;
	end
	else begin
		if(enmhp3>80)begin
			if(enmy3<150)enmy3<=enmy3+1;
			else enmy3<=150;
		end
		
		else if(enmhp3>40)begin
			if(enmx3<504)enmx3<=enmx3+1;
			else enmx3<=184;
		end
		
		else if(enmhp3==0)
			enmx3<=0;
		
		else begin
			if(enmx3>344)begin
				enmx3<=enmx3-1;
				enmy3<=enmx3-233;
			end
			else if(enmx3>184)begin
				enmx3<=enmx3-1;
				enmy3<=455-enmx3;
			end
			else begin
				enmx3<=504;
				enmy3<=271;
			end
		end
	end
end

always@(posedge clk_10ms)begin
	if(switch)begin
		enmx4<=440;
		enmy4<=40;
	end
	else begin
		if(enmhp4>80)begin
			if(enmy4<200)enmy4<=enmy4+1;
			else enmy4<=200;
		end
		
		else if(enmhp4>40)begin
			if(enmx4<504)enmx4<=enmx4+1;
			else enmx4<=184;
		end
		
		else if(enmhp4==0)
			enmx4<=0;
		
		else begin
			if(enmx4<344)begin
				enmx4<=enmx4+1;
				enmy4<=enmx4+87;
			end
			else if(enmx4<504)begin
				enmx4<=enmx4+1;
				enmy4<=775-enmx4;
			end
			else begin
				enmx4<=184;
				enmy4<=271;
			end
		end
	end
end

endmodule
