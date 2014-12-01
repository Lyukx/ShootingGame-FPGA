`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:26 11/04/2013 
// Design Name: 
// Module Name:    counter_26bit 
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
module counter_26bit(clk,clk_1ms//,count_out
    );
	parameter COUNTER=26;
	input clk;
	output clk_1ms;
//	output [COUNTER-1:0] count_out;
	reg [COUNTER-1:0] count;
	reg second_m;
	wire clk;
//	wire [COUNTER-1:0] count_out;
	
	initial
		count<=0;
		
		always@(posedge clk)begin
			if(count[15:0]==49999)begin
				count[15:0]<=0;
				count[25:16]<=count[25:16]+1;
				second_m<=1;
			end
			
			else begin
				count[15:0] <= count[15:0]+1;
				second_m<=0;
			end
		end
		assign clk_1ms=second_m;
//		assign count_out=count;

endmodule
