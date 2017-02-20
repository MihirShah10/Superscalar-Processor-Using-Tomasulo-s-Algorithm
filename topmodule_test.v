`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module topmodule_test;

	// Inputs
	reg MR_Status;
	reg clk;
	reg ADD_Status;
	
	// Outputs
	wire [4:0] clock_count;
	wire [2:0] ADD_Tag_ip;
	wire [7:0] ADD_Operand1;
	wire [7:0] ADD_Operand2;
	wire [2:0] select;

	// Bidirs
	wire AR_Status;
	wire [1:0] select_instruction;

	// Instantiate the Unit Under Test (UUT)
	Top_Module uut (
		.clock_count(clock_count), 
		.ADD_Tag_ip(ADD_Tag_ip), 
		.AR_Status(AR_Status), 
		.ADD_Operand1(ADD_Operand1), 
		.ADD_Operand2(ADD_Operand2), 
		.select(select), 
		.select_instruction(select_instruction), 
		.ADD_Status(ADD_Status),
		.MR_Status(MR_Status), 
		.clk(clk)
	);

	initial clk = 0;
	
	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		MR_Status = 0;
		ADD_Status = 0;
		

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

