`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:33 09/26/2012 
// Design Name: 
// Module Name:    SEC_CLK 
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


module clk2( // This slowclock is taken from Dr.Butkas lab 2 presentation 
    input CLK100MHZ,
    input BTNC,
    input [31:0] counter,
    output reg SLWCLK
    );
     reg [31:0] ClkCounter;
     
    always @(posedge CLK100MHZ)
        begin

            if (ClkCounter < counter)
                begin
                
                if(BTNC==1)
                begin
                ClkCounter <= ClkCounter + 120; // This is the test mode that increments the time faster 
                end
                else
                begin
                ClkCounter <= ClkCounter + 1; // Normal mode that increments the clock at a normal speed(Every 60 Seconds)
                end
                
               
                end
                
            else
                begin 
                ClkCounter <= 0;
                SLWCLK = ~SLWCLK;
                end
        end
endmodule
