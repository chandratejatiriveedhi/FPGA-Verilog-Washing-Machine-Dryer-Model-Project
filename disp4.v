`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:29 09/26/2012 
// Design Name: 
// Module Name:    disp4 
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
module disp4(// Seven segment display module is used from Dr.Butkas presentation of Lab 2 
    input CLK100MHZ,
    input [12:0] VALUE,
    output reg [7:0] CA,
    output reg [7:0] AN
    );
reg [20:0] digit_counter;
reg [3:0] digits;
always @(posedge CLK100MHZ)
begin
	digit_counter<=digit_counter+1;
	case (digits)
						// pgfedcba
			0:CA = 8'b11000000;
		1:CA = 8'b11111001;
		2:CA = 8'b10100100; 
		3:CA = 8'b10110000;
		4:CA = 8'b10011001; 
		5:CA = 8'b10010010; 
		6:CA = 8'b10000010; 
		7:CA = 8'b11111000; 
		8:CA = 8'b10000000;
		9:CA = 8'b10010000;
		10:CA=~8'b01110111; 
		11:CA=~8'b01111100; 
		12:CA=~8'b00111001; 
		13:CA=~8'b01011110; 
		14:CA=~8'b01111001; 
		15:CA=~8'b01110001; 
	 endcase
 
	case (digit_counter[15:14])
//		0 : begin
//				AN=8'b11110111;
//				digits<=VALUE[15:12];
//			end
		1 : begin
				AN=8'b11111011;
				digits<=VALUE[11:8];
			end
		2 : begin
				AN=8'b11111101;
				digits<=VALUE[7:4];
			end
		3 : begin
				AN=8'b11111110;
				digits<=VALUE[3:0];
			end
		
	endcase	

end

endmodule
