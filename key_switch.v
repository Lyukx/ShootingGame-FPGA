`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:16 11/04/2013 
// Design Name: 
// Module Name:    key_switch 
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
module key_switch(clk_1ms,push,push_out);

		parameter COUNTER=26;
		input clk_1ms;
		input push;
		output reg push_out;
		
		reg [7:0] pbshift;
		always@(posedge clk_1ms)begin
			pbshift=pbshift<<1;
			pbshift[0]=push;
			if(pbshift==0)
				push_out=0;
			if(pbshift==8'hFF)
				push_out=1;
		end

endmodule
