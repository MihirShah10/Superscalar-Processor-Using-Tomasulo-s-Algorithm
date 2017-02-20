`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:39:17 04/09/2016
// Design Name:   Adder_Unit
// Module Name:   /home/eng/s/spp150130/spp150130/Tomasulo_Implementation/ADD_test.v
// Project Name:  Tomasulo_Implementation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADD_test;

	// Inputs
	reg [2:0] ADD_Tag_ip;
	reg [7:0] Source_Reg1;
	reg [7:0] Source_Reg2;
	reg clk;

	// Outputs
	wire [2:0] count;
	wire ADD_Status;
	wire [7:0] ADD_Output;
	wire [2:0] ADD_Tag_op;

	// Instantiate the Unit Under Test (UUT)
	Adder_Unit uut (
		.count(count), 
		.ADD_Status(ADD_Status), 
		.ADD_Output(ADD_Output), 
		.ADD_Tag_op(ADD_Tag_op), 
		.ADD_Tag_ip(ADD_Tag_ip), 
		.Source_Reg1(Source_Reg1), 
		.Source_Reg2(Source_Reg2), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		ADD_Tag_ip = 0;
		Source_Reg1 = 0;
		Source_Reg2 = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

