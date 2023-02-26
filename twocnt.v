`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2019 07:09:55 AM
// Design Name: 
// Module Name: twocnt
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


module twocnt(
  input CLK100MHZ,
  input bin,//borrow in 
 input BTND,
input BTNU,
input [5:0] SW,
output reg [15:0] LED,
    output reg [3:0] count
    );
    

	 reg  [3:0] bval;	  
	 reg old_bin;
	 reg [2:0] i=0;
	 
	 always @(posedge CLK100MHZ)	
		begin
		old_bin<=bin;
		bval<=count[3:0];
		
		case (i) 0:begin
		          if((SW[1]==1||SW[2]==1||SW[3]==1||SW[4]==1)&&(BTND==1))// ensures that the dollar amount is entered after the mode is chosen. Pressing BTND enters 2 dollar which is high temperature wash
		          begin
		          count[3:0]<=2;
		          i<=1;
		          end
		          
		          
		          if((SW[4]!=1)&&(SW[1]==1||SW[2]==1||SW[3]==1)&&(BTNU==1)) // ensures that the dollar amount is entered after the mode is chosen. Pressing BTNU enters 1 dollar which is low temperature wash. Drier doesn't take 1 dollar as the drier has to run at high temperature. Drier takes only two dollars to run at high temperature.  
		          begin
		          count[3:0]<=1;
		          i<=1;
		          end
		          
		        
		          
	
		          
	              if((SW[1]!=1)&&(SW[2]!=1)&&(SW[3]!=1)&&(SW[4]!=1)&&(BTNU!=1)&&(BTND!=1)) // ensures that nothing is set when the buttons and switches are not pressed
	              begin
	              count[3:0]<=0;
	              i<=0;
	              end	
	              
	              if(SW[1]!=1&&SW[2]!=1&&SW[3]!=1&&SW[4]!=1)//ensures that nothing is set when switches arent high
	              begin
	              count[3:0]<=0;
	              i<=0;
	              end
	                                  
		          end
		          
		          	
		
       1:    begin
		if ((old_bin==0) & (bin==1))
			 begin
            if ((bval==2))   // after the wash/drier cycle is complete the dollar amount resets back to 0. LED[4] would turn on after drier cycle is complete. LED[3] would turn on after wash cycle is complete
            begin 
					count<=4'h0;
					LED[3]=(SW[1]||SW[2]||SW[3])&&(SW[4]==0);
					LED[4]=SW[4];
					end
	 			 else if (bval==1) // after the wash/drier cycle is complete the dollar amount resets back to 0. LED[4] would turn on after drier cycle is complete.LED[3] would turn on after wash cycle is complete
	 			 begin
					count<=4'h0;
					LED[3]=SW[1]||SW[2]||SW[3]&&(SW[4]==0);
					LED[4]=SW[4];
					end
             else if(bval==0)
              begin
              count<=4'h0;
             end
	
	end
	end
	endcase
	end
endmodule

