`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:10 12/25/2013 
// Design Name: 
// Module Name:    vga_hcvc 
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
module vga_hcvc(clk,hsync,vsync,hc,vc,video_out);
input clk;
output reg hsync;
output reg vsync;
output reg [9:0]hc;
output reg [9:0]vc;
output reg video_out;

reg vsenble;

parameter hpixel=10'b1100100000;//800
parameter vline=10'b1000001001;//521
parameter hFrontPorch=10'b1100010000;//784(128+16+640)
parameter hBackPorch=10'b0010010000;//144(128+16)
parameter vFrontPorch=10'b0111111111;//511(2+29+480)
parameter vBackPorch=10'b0000001111;//31

initial begin
	hsync<=0;
	vsync<=0;
	hc<=0;
	vc<=0;
end

//ÐÐÉ¨Ãè×´Ì¬»ú
always@(posedge clk) begin
//	if(RESET==0)
//		hc<=0;
//	else begin
		if(hc==hpixel-1) begin
			hc<=0;
			vsenble<=1;
		end
		else begin
			hc<=hc+10'b0000000001;
			vsenble<=0;
		end
//	end
end 

//Ö¡É¨Ãè×´Ì¬»ú
always@(posedge clk) begin
//	if(RESET==0)
//		vc<=0;
//	else begin
		if(vsenble==1) begin
			if(vc==vline-1)
				vc<=0;
			else
				vc<=vc+10'b0000000001;
//		end
	end
end

always@(*) begin
	if(hc<96)
		hsync=0;
	else
		hsync=1;
end

always@(*) begin
	if(vc<2)
		vsync=0;
	else
		vsync=1;
end

always@(*) begin
	if((hc<hFrontPorch)&&(hc>hBackPorch)&&(vc<vFrontPorch)&&(vc>vBackPorch))
		video_out=1;
	else
		video_out=0;
end

endmodule
