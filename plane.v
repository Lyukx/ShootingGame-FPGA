`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:30 02/09/2014 
// Design Name: 
// Module Name:    plane 
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
module plane(clk_10ms,gameover,btnstate,planex,planey);
//自机图像大小30*37
//自机中心点活动区域大小：290*363,左上角绝对坐标（144+40+15,31+40+19）=(199,90)，相对坐标（15,19）~（305,382）
input clk_10ms;
input gameover;
input [3:0]btnstate;
output reg [9:0]planex;
output reg [9:0]planey;


initial begin
	planex<=160+184;
	planey<=342+71;
end

always@(posedge clk_10ms)begin
	if(gameover)begin
		planex<=0;
		planey<=planey+1;
	end
	else begin
		if(btnstate[0]&&(planex>=199)&&(planex<=489)&&(planey>=91)&&(planey<=453))
			planey<=planey-1;
		else if(btnstate[1]&&(planex>=200)&&(planex<=489)&&(planey>=90)&&(planey<=453))
			planex<=planex-1;
		else if(btnstate[3]&&(planex>=199)&&(planex<=489)&&(planey>=90)&&(planey<=452))
			planey<=planey+1;
		else if(btnstate[2]&&(planex>=199)&&(planex<=488)&&(planey>=90)&&(planey<=453))
			planex<=planex+1;
		else if(planex<=0) begin
			planex<=160+184;
			planey<=342+71;
		end
		else
			planex<=planex;
	end
end

endmodule
