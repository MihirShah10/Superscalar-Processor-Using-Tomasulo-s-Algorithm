

module test_IQ;

	// In
	reg [1:0] select_instruction;
	reg clk;

	// Outputs
	wire [7:0] program_counter;
	wire [7:0] inst1_type;
	wire [7:0] inst1_destination_reg;
	wire [7:0] inst1_source_reg1;
	wire [7:0] inst1_source_reg2;
	wire [7:0] inst2_type;
	wire [7:0] inst2_destination_reg;
	wire [7:0] inst2_source_reg1;
	wire [7:0] inst2_source_reg2;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Queue uut (
		.inst1_type(inst1_type), 
		.inst1_destination_reg(inst1_destination_reg), 
		.inst1_source_reg1(inst1_source_reg1), 
		.inst1_source_reg2(inst1_source_reg2), 
		.inst2_type(inst2_type), 
		.inst2_destination_reg(inst2_destination_reg), 
		.inst2_source_reg1(inst2_source_reg1), 
		.inst2_source_reg2(inst2_source_reg2),  
		.select_instruction(select_instruction), 
		.clk(clk)
	);
   initial clk=0;
	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		//program_counter = 0;
		//select_instruction = 0;
		
		// Wait 100 ns for global reset to finish
		#100  select_instruction = 2'b00;
	
		#200  select_instruction = 2'b10;
		#200  select_instruction = 2'b10;
		
		#200	select_instruction = 2'b10;
		#200  select_instruction = 2'b10;
        
		// Add stimulus here
	end
	
      
endmodule

