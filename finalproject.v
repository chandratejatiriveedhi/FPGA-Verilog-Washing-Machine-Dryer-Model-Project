`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 11:42:58 PM
// Design Name: 
// Module Name: finalproject
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


module finalproject(
input CLK100MHZ,
    input BTNU,
  input BTND,
    input BTNC,
    input [5:0] SW,
    output [7:0] CA,
    output [7:0] AN,
    output [15:0] LED
    

    );
    
   wire [3:0] minutes;
  wire[3:0] ten_minutes;
   wire [3:0] dollars;
   wire minute_borrow,ten_minute_borrow;
   wire SLWCLK;
  clk2 secs (.CLK100MHZ(CLK100MHZ),.BTNC(BTNC),.SLWCLK(SLWCLK),.counter(3000000000));// slowclock module which also includes the fast mode for test  
  disp4 disp (.CLK100MHZ(CLK100MHZ),.VALUE({dollars,ten_minutes,minutes}),.CA(CA),.AN(AN)); 
  tencounter mincnt (.CLK100MHZ(CLK100MHZ),.bin(SLWCLK),.count(minutes),.borrowout(minute_borrow),.SW(SW),.BTNU(BTNU),.BTND(BTND)); // This is the counter module for ones of minutes 
  sixcounter tenmincnt (.CLK100MHZ(CLK100MHZ),.bin(minute_borrow),.count(ten_minutes),.SW(SW),.borrowout(ten_minute_borrow),.BTNU(BTNU),.BTND(BTND),.LED(LED)); // This is the counter module for tens of minutes
  twocnt count (.CLK100MHZ(CLK100MHZ),.bin(ten_minute_borrow),.count(dollars),.BTND(BTND),.BTNU(BTNU),.LED(LED),.SW(SW)); // This is the module that enters dollars(amount) based on the button press

  
  endmodule
