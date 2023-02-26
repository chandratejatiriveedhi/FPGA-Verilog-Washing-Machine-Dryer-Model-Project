`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2019 05:53:54 AM
// Design Name: 
// Module Name: twocounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module twocount(
   input CLK100MHZ,cin,
//    input BTNL,
//    input BTNU,
    output reg [3:0] count=2
    );
    

	 reg  [3:0] cval;	  
	 reg old_cin;
	 
	 always @(posedge CLK100MHZ)	
		begin
		old_cin<=cin;
		cval<=count[3:0];
		
           begin
		if ((old_cin==0) & (cin==1))
			 begin
            if ((cval==2))
            begin //line of code that increments the count of the hour display. cval is the hour display. 
					count<=4'h0;
					end
	 			 else if (cval==1)
	 			 begin
					count<=4'h0;








			end
	
	end
	end
	

endmodule

