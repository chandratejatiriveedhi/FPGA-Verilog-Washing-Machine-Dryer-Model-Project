# FPGA-Verilog-Washing-Machine-Dryer-Model-Project
This is a project I have done for my verilog class and it models daily usage of washing machine/dryer on Nexys A7 board


How to operate?

: You need to clone the repository and install Vivado. 
: You can import the .v files to Vivado and connect your laptop to Nexys A7 board. 

:You need to choose either 1 of the mode: Delicates, Normal Wash, Power Wash, Dryer
:SW 1 shall set to delicates 
:SW 2 shall set to Normal 
:SW 3 shall set to Power Wash 
	:SW 4 shall set to Drier 

:Once you select the mode, you need to select the temperature. 


:Selecting the temperature is based on the amount you insert. 

:1 dollar will be low temperature, 2 dollars will be high temperature

:BTND inserts 2 dollars and BTNU inserts 1 dollar

: Once set the mode can’t be changed unless/until the device is reprogrammed. 

: Dryer can only operate at high temperature

: Note: If you press BTNU at SW[4]==1, nothing would be set but to set to another mode using different switch apart from SW[4], you will need to reprogram the device. 

If BTNC is pressed, it will increment 30 seconds faster. 

: More details on how to operate and expected results in Final Project presentation power point 
