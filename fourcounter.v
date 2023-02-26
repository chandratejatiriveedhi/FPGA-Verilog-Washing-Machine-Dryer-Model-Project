`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 11:44:17 PM
// Design Name: 
// Module Name: fourcounter
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


module sixcounter(
input CLK100MHZ,
input bin,//borrow in
input [5:0] SW,
input BTNU,
input BTND,
output reg [15:0] LED,

    output reg [3:0] count,
    output reg borrowout
    );
    
    reg old_bin;
    reg [2:0] i=0;
    

always @(posedge CLK100MHZ)	
begin
old_bin<=bin;



case (i)                     0: begin
                                if((SW[1]==1)&&(BTNU==1||BTND==1)) // if statement to set the delicates wash mode value of tens minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=3;
                                  i<=1;
                                  end
                                  if((SW[2]==1||SW[3]==1)&&(BTNU==1||BTND==1)) // if statement to set the normal wash mode and power wash mode value of tens minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=4;
                                  i<=1;
                                  end
                            
                                  if((SW[4]==1)&&(BTND==1)) // if statement to set the drier value of tens minute, goes to the slowclock once set and begins decrement. This statement ensures that the value is set only when the dollar amount is entered
                                  begin
                                  count[3:0]<=6;
                                  i<=1;
                                  end
                                  
                                  if((SW[4]==1)&&(BTNU==1)) // if statement to set the drier value of tens minute to 0, when 1 dollar is entered. doesn't go to slowclock
                                  begin
                                  count[3:0]<=0;
                                  i<=0;
                                  end
                                  
                                  if((SW[1]!=1)&&(SW[2]!=1)&&(SW[3]!=1)&&(SW[4]!=1)&&(BTNU!=1)&&(BTND!=1)) //ensures that nothing is set when switches aren't high
                                  begin
                                  count[3:0]=0;
                                  i<=0;
                                  end
                                
                                  
                                  end 
                                  
       
                                  
                                  1:  begin
if ((old_bin==0) & (bin==1)) //slowclock
			 begin
			 
			  if(count==6)   // This statement ensures LED[0] turns on when the drier cycle has begun. Also decrements the value. 
			 	 begin
			 	 LED[0]<=SW[4];
			 	  count<=count-1;
		           borrowout<=0;
			 	 end
			 	 
			 if(count==5) //decrements the count
			 	 begin
			 	  count<=count-1;
		           borrowout<=0;
			 	 end
			 	 
			 	 if(count==4) //decrements the count 
			 	 begin
			 	  count<=count-1;
		           borrowout<=0;
			 	 end
                                if (count==3) // This statement ensures that LED[1] turns on after every wash stage cycle is completed. LED turns on according to the mode and after wash stage cycle time is completed as per the requirement.Decrements the count
		                          begin
		                           LED[1]=(SW[1]||SW[2]||SW[3])&&(SW[4]==0);
		                      count<=count-1;
		                      borrowout<=0;
		                         end
		                         
		                          if (count==2) 
		                          begin
		                           LED[2]=(SW[1]||SW[2]||SW[3])&&(SW[4]==0); // This statement ensures that LED[2] turns on after every rinse stage cycle is completed. LED turns on according to the mode and after rinse stage cycle time is completed as per the requirement.Decrements the count
		                      count<=count-1;
		                      borrowout<=0;
		                         end
		                         
		                          if (count==1) // decrements the count
		                          begin
		                      count<=count-1;
		                      borrowout<=0;
		                         end
		                         
		                         
	                       if(count==0) //when the count reaches 0, there is a borrowout of 1
		                          begin
			                 count<=0;
			                 borrowout<=1;
		                      end
		                  
		                       
		end


	
	end
	endcase
	end
	
endmodule
