`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:52:40 04/30/2016
// Design Name:   Top_Module
// Module Name:   /home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Top_test.v
// Project Name:  Tomasulo_Implementation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_test;

	// Inputs
	reg clk;

	// Outputs
	//wire [19:0] UP1;
	//wire [19:0] UP2;
	wire [7:0] Op1;
	wire [7:0] Op2;
	wire [7:0] Op3;
	wire [7:0] Op4;
	wire [2:0] count;
	wire [2:0] count2;
	wire ADD_Status;
	wire [7:0] ADD_Output;
	wire [2:0] ADD_Tag_op;
	wire MUL_Status;
	wire [7:0] MUL_Output;
	wire [2:0] MUL_Tag_op;

	// Bidirs
	wire [4:0] clock_count;

	// Instantiate the Unit Under Test (UUT)
	Top_Module uut (
	//	.UP1(UP1),
	//	.UP2(UP2),
		.Op1(Op1), 
		.Op2(Op2), 
		.Op3(Op3), 
		.Op4(Op4), 
		.clock_count(clock_count), 
		.count(count), 
		.count2(count2), 
		.ADD_Status(ADD_Status), 
		.ADD_Output(ADD_Output), 
		.ADD_Tag_op(ADD_Tag_op), 
		.MUL_Status(MUL_Status), 
		.MUL_Output(MUL_Output), 
		.MUL_Tag_op(MUL_Tag_op), 
		.clk(clk)
	);

initial clk=0;

always #100 clk=~clk;

	initial begin
		// Initialize Inputs

	end
      
endmodule

