`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:05:00 04/10/2016
// Design Name:   ADD_Reservation_Station
// Module Name:   /home/eng/s/spp150130/spp150130/Tomasulo_Implementation/ADD_RS_Test.v
// Project Name:  Tomasulo_Implementation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADD_Reservation_Station
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADD_RS_Test;

	// Inputs
	reg [7:0] Operand1;
	reg [7:0] Operand2;
	reg [2:0] Operand1_Tag;
	reg [2:0] Operand2_Tag;
	reg Operand1_Vbit;
	reg Operand2_Vbit;
	reg ADD_Status;
	reg clk;

	// Outputs
	wire [2:0] ADD_Tag_ip;
	wire E1;
	wire E2;
	wire E3;
	wire E4;
	wire AR_Status;
	wire [7:0] AR_Out_Operand1;
	wire [7:0] AR_Out_Operand2;
   wire [2:0]select;
	// Instantiate the Unit Under Test (UUT)
	ADD_Reservation_Station uut (
		.ADD_Tag_ip(ADD_Tag_ip), 
		.E1(E1), 
		.E2(E2), 
		.E3(E3), 
		.E4(E4), 
		.AR_Status(AR_Status), 
		.AR_Out_Operand1(AR_Out_Operand1), 
		.AR_Out_Operand2(AR_Out_Operand2),
      .select(select),		
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.Operand1_Tag(Operand1_Tag), 
		.Operand2_Tag(Operand2_Tag), 
		.Operand1_Vbit(Operand1_Vbit), 
		.Operand2_Vbit(Operand2_Vbit), 
		.ADD_Status(ADD_Status), 
		.clk(clk)
	);

		// Initialize Inputs
		/*Operand1 = 0;
		Operand2 = 0;
		Operand1_Tag = 0;
		Operand2_Tag = 0;
		Operand1_Vbit = 0;
		Operand2_Vbit = 0;
		ADD_Status = 0;
		clk = 0;*/

		// Wait 100 ns for global reset to finish
initial clk=0;
  	always #100 clk = ~clk;
 	
initial begin

		// Add stimulus here
	#100 ADD_Status=1'b0;
	     Operand1=8'b00000001;
	     Operand2=8'b00000010;
		  Operand1_Tag=3'b001;
	     Operand2_Tag=3'b010;
	     Operand1_Vbit=1'b0;
	     Operand2_Vbit=1'b1;

#200    ADD_Status=1'b0;
	     Operand1=8'b00001000;
	     Operand2=8'b00000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
		  
	#200 ADD_Status=1'b0;
	     Operand1=8'b00101000;
	     Operand2=8'b01000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
		  
#200    ADD_Status=1'b0;
	     Operand1=8'b00001000;
	     Operand2=8'b00000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b0;
		  
	#200 ADD_Status=1'b0;
	     Operand1=8'b00101000;
	     Operand2=8'b01000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b0;
		  
		  #200    ADD_Status=1'b0;
	     Operand1=8'b00001000;
	     Operand2=8'b00000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
		  
	#200 ADD_Status=1'b0;
	     Operand1=8'b00101000;
	     Operand2=8'b01000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
		  
		  #200    ADD_Status=1'b0;
	     Operand1=8'b00001000;
	     Operand2=8'b00000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
		  
	#200 ADD_Status=1'b0;
	     Operand1=8'b00101000;
	     Operand2=8'b01000100;
		  Operand1_Tag=3'b101;
	     Operand2_Tag=3'b110;
	     Operand1_Vbit=1'b1;
	     Operand2_Vbit=1'b1;
	end
      
endmodule

