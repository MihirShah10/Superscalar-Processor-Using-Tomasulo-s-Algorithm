`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Multiplier_test;

	// Inputs
	reg [2:0] MUL_Tag_ip;
	reg [7:0] MUL_Operand3;
	reg [7:0] MUL_Operand4;
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
		.MUL_Operand3(MUL_Operand3), 
		.MUL_Operand4(MUL_Operand4), 
		.clk(clk)
	);

	initial clk = 0;

	always #100 clk = ~clk;
	initial begin
		// Initialize Inputs

		#600 	
				MUL_Tag_ip = `x;
				MUL_Operand3 = `R0;
				MUL_Operand4= `R1;
		
		#800 	MUL_Tag_ip = `y;
				MUL_Operand3 = `R12;
				MUL_Operand4= `R13;
	end
      
endmodule

