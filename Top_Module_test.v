
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Top_Module_test;

	// Inputs
	reg AR_Status;
	reg MR_Status;
	reg clk;

	// Outputs
	wire [1:0] select_instruction;
	wire [7:0] IDU_out_inst1_type;
	wire [7:0] IDU_out_inst1_destination_reg1;
	wire [7:0] IDU_out_inst1_source_reg1;
	wire [7:0] IDU_out_inst1_source_reg2;
	wire [7:0] IDU_out_inst2_type;
	wire [7:0] IDU_out_inst2_destination_reg2;
	wire [7:0] IDU_out_inst2_source_reg3;
	wire [7:0] IDU_out_inst2_source_reg4;

	// Instantiate the Unit Under Test (UUT)
	Top_Module uut (
		.select_instruction(select_instruction),
		.IDU_out_inst1_type(IDU_out_inst1_type), 
		.IDU_out_inst1_destination_reg1(IDU_out_inst1_destination_reg1), 
		.IDU_out_inst1_source_reg1(IDU_out_inst1_source_reg1), 
		.IDU_out_inst1_source_reg2(IDU_out_inst1_source_reg2), 
		.IDU_out_inst2_type(IDU_out_inst2_type), 
		.IDU_out_inst2_destination_reg2(IDU_out_inst2_destination_reg2), 
		.IDU_out_inst2_source_reg3(IDU_out_inst2_source_reg3), 
		.IDU_out_inst2_source_reg4(IDU_out_inst2_source_reg4), 
		.AR_Status(AR_Status), 
		.MR_Status(MR_Status), 
		.clk(clk)
	);

	initial clk = 0;
	
	always #100 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		AR_Status = 0;
		MR_Status = 0;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

