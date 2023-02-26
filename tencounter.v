`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 11:42:22 PM
// Design Name: 
// Module Name: tencounter
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


module tencounter(
 input CLK100MHZ,
    input bin, // borrowin 
    input[5:0] SW,
    input BTNU,
    input BTND,
    output reg  [3:0] count,
    output reg borrowout
    );
    reg old_bin;
    reg  [2:0] i=0;
    
always @(posedge CLK100MHZ)	
begin
old_bin<=bin; 

 case(i)                         0: begin
                                if((SW[1]==1)&&(BTNU==1||BTND==1)) // if statement to set the delicates mode of ones minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=6;
                                  i<=1;
                                  end 
                                  
                                  if((SW[2]==1)&&(BTNU==1||BTND==1)) // if statement to set the normal mode value of ones minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=0;
                                  i<=1;
                                  end
                                  
                                  if((SW[3]==1)&&(BTNU==1||BTND==1)) // if statement to set the power wash mode value of ones minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=5;
                                  i<=1;
                                  end
                                  
                                 if((SW[4]==1)&&(BTND==1||BTNU==1)) // if statement to set the drier mode value of ones minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=0;
                                  i<=1;
                                  end
                                  
                                  if((SW[1]!=1)&&(SW[2]!=1)&&(SW[3]!=1)&&(SW[4]!=1)&&(BTND!=1)&&(BTNU!=1)) //ensures that nothing is set when switches aren't high
                                  begin
                                  count[3:0]=0;
                                  i<=0;
                                  end
                                  

                                

                                  end   
                                                            
                         1: begin
if ((old_bin==0) & (bin==1)) //slowclock
			 begin
                                  
                                if (count>0)  // decrements the count
		                          begin
		                      count<=count-1;
		                      borrowout<=0;
		                         end
		                     
		                         
	                       if(count==0)   // when the count reaches 0, it increments by 9 and there is a borrowout
		                          begin
			                 count<=count+9;
			                 borrowout<=1;
		                      end
		                 
	end
	end
	endcase
	end
	
endmodule
