`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:21 02/19/2014 
// Design Name: 
// Module Name:    numselect 
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
module numselect(clk,score,vc,hc,Dnum);
input clk;
input [19:0]score;
input [9:0]vc;
input [9:0]hc;
output reg [7:0]Dnum;

reg [7:0]adrnum;
wire [7:0]Dnum0;
wire [7:0]Dnum1;
wire [7:0]Dnum2;
wire [7:0]Dnum3;
wire [7:0]Dnum4;
wire [7:0]Dnum5;
wire [7:0]Dnum6;
wire [7:0]Dnum7;
wire [7:0]Dnum8;
wire [7:0]Dnum9;

num0 n0(clk,adrnum,Dnum0);
num1 n1(clk,adrnum,Dnum1);
num2 n2(clk,adrnum,Dnum2);
num3 n3(clk,adrnum,Dnum3);
num4 n4(clk,adrnum,Dnum4);
num5 n5(clk,adrnum,Dnum5);
num6 n6(clk,adrnum,Dnum6);
num7 n7(clk,adrnum,Dnum7);
num8 n8(clk,adrnum,Dnum8);
num9 n9(clk,adrnum,Dnum9);

always@(posedge clk)begin
	if((hc>=516)&&(hc<532))begin
		adrnum<=hc-516+(vc-175)*16;
		case(score[3:0])
			4'b0000:Dnum<=Dnum0;
			4'b0001:Dnum<=Dnum1;
			4'b0010:Dnum<=Dnum2;
			4'b0011:Dnum<=Dnum3;
			4'b0100:Dnum<=Dnum4;
			4'b0101:Dnum<=Dnum5;
			4'b0110:Dnum<=Dnum6;
			4'b0111:Dnum<=Dnum7;
			4'b1000:Dnum<=Dnum8;
			default:Dnum<=Dnum9;
		endcase
	end
	else if((hc>=532)&&(hc<548))begin
		adrnum<=hc-532+(vc-175)*16;
		case(score[3:0])
			4'b0000:Dnum<=Dnum0;
			4'b0001:Dnum<=Dnum1;
			4'b0010:Dnum<=Dnum2;
			4'b0011:Dnum<=Dnum3;
			4'b0100:Dnum<=Dnum4;
			4'b0101:Dnum<=Dnum5;
			4'b0110:Dnum<=Dnum6;
			4'b0111:Dnum<=Dnum7;
			4'b1000:Dnum<=Dnum8;
			default:Dnum<=Dnum9;
		endcase
	end
	else if((hc>=548)&&(hc<564))begin
		adrnum<=hc-548+(vc-175)*16;
		case(score[3:0])
			4'b0000:Dnum<=Dnum0;
			4'b0001:Dnum<=Dnum1;
			4'b0010:Dnum<=Dnum2;
			4'b0011:Dnum<=Dnum3;
			4'b0100:Dnum<=Dnum4;
			4'b0101:Dnum<=Dnum5;
			4'b0110:Dnum<=Dnum6;
			4'b0111:Dnum<=Dnum7;
			4'b1000:Dnum<=Dnum8;
			default:Dnum<=Dnum9;
		endcase
	end
	else if((hc>=564)&&(hc<580))begin
		adrnum<=hc-564+(vc-175)*16;
		case(score[3:0])
			4'b0000:Dnum<=Dnum0;
			4'b0001:Dnum<=Dnum1;
			4'b0010:Dnum<=Dnum2;
			4'b0011:Dnum<=Dnum3;
			4'b0100:Dnum<=Dnum4;
			4'b0101:Dnum<=Dnum5;
			4'b0110:Dnum<=Dnum6;
			4'b0111:Dnum<=Dnum7;
			4'b1000:Dnum<=Dnum8;
			default:Dnum<=Dnum9;
		endcase
	end
	else begin
		adrnum<=hc-580+(vc-175)*16;
		case(score[3:0])
			4'b0000:Dnum<=Dnum0;
			4'b0001:Dnum<=Dnum1;
			4'b0010:Dnum<=Dnum2;
			4'b0011:Dnum<=Dnum3;
			4'b0100:Dnum<=Dnum4;
			4'b0101:Dnum<=Dnum5;
			4'b0110:Dnum<=Dnum6;
			4'b0111:Dnum<=Dnum7;
			4'b1000:Dnum<=Dnum8;
			default:Dnum<=Dnum9;
		endcase
	end
end

endmodule
