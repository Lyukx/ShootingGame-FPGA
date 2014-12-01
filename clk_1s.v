`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:25 12/30/2013 
// Design Name: 
// Module Name:    clk_1s 
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
module clk_1s(clk,clk_1s
    );
	input clk;
	output reg clk_1s;
	reg [26:0] counter;
	
	initial
		counter<=0;
	
	always@(posedge clk)begin
		if(counter<=100000000)
			counter<=counter+27'b00000000000000000000000001;
		else begin
			clk_1s<=~clk_1s;
			counter<=27'b00000000000000000000000000;
		end
	end

endmodule
