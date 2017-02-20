`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:26 04/09/2016
// Design Name:   Multiplier_Unit
// Module Name:   /home/eng/s/spp150130/spp150130/Tomasulo_Implementation/MUL_Test.v
// Project Name:  Tomasulo_Implementation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplier_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"


module MUL_Test;

	// Inputs
	reg [2:0] MUL_Tag_ip;
	reg [7:0] Source_Reg1;
	reg [7:0] Source_Reg2;
	reg clk;

	// Outputs
	wire [2:0] count;
	wire MUL_Status;
	wire [7:0] MUL_Output;
	wire [2:0] MUL_Tag_op;

	// Instantiate the Unit Under Test (UUT)
	Multiplier_Unit uut (
		.count(count), 
		.MUL_Status(MUL_Status), 
		.MUL_Output(MUL_Output), 
		.MUL_Tag_op(MUL_Tag_op), 
		.MUL_Tag_ip(MUL_Tag_ip), 
		.Source_Reg1(Source_Reg1), 
		.Source_Reg2(Source_Reg2), 
		.clk(clk)
	);

	initial clk = 0;
	
	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		#1300 	MUL_Tag_ip = `z;
				Source_Reg1 = 8'b0000101;
				Source_Reg2 = 8'b0000010;
		
		#1200 	MUL_Tag_ip = `b;
				Source_Reg1 = 8'b00000001;
				Source_Reg2 = 8'b00001111;
				
		
		
		#5000 $finish;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

