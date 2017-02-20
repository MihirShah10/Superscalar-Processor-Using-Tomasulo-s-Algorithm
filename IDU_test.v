`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module IDU_test;

	// Inputs
	reg IDU_out_inst1_destination_reg;
	reg IDU_out_inst2_destination_reg;
	reg IDU_out_inst2_source_reg1;
	reg IDU_out_inst2_source_reg2;
	reg [7:0] IDU_in_inst1_type;
	reg IDU_in_inst1_destination_reg;
	reg [7:0] IDU_in_inst1_source_reg1;
	reg [7:0] IDU_in_inst1_source_reg2;
	reg [7:0] IDU_in_inst2_type;
	reg IDU_in_inst2_destination_reg;
	reg IDU_in_inst2_source_reg1;
	reg IDU_in_inst2_source_reg2;
	reg AR_Status;
	reg MR_Status;

	// Outputs
	wire [1:0] select_instruction;
	wire [7:0] IDU_out_inst1_type;
	wire [7:0] IDU_out_inst1_source_reg1;
	wire [7:0] IDU_out_inst1_source_reg2;
	wire [7:0] IDU_out_inst2_type;

	// Instantiate the Unit Under Test (UUT)
	IDU uut (
		.select_instruction(select_instruction), 
		.IDU_out_inst1_type(IDU_out_inst1_type), 
		.IDU_out_inst1_destination_reg(IDU_out_inst1_destination_reg), 
		.IDU_out_inst1_source_reg1(IDU_out_inst1_source_reg1), 
		.IDU_out_inst1_source_reg2(IDU_out_inst1_source_reg2), 
		.IDU_out_inst2_type(IDU_out_inst2_type), 
		.IDU_out_inst2_destination_reg(IDU_out_inst2_destination_reg), 
		.IDU_out_inst2_source_reg1(IDU_out_inst2_source_reg1), 
		.IDU_out_inst2_source_reg2(IDU_out_inst2_source_reg2), 
		.IDU_in_inst1_type(IDU_in_inst1_type), 
		.IDU_in_inst1_destination_reg(IDU_in_inst1_destination_reg), 
		.IDU_in_inst1_source_reg1(IDU_in_inst1_source_reg1), 
		.IDU_in_inst1_source_reg2(IDU_in_inst1_source_reg2), 
		.IDU_in_inst2_type(IDU_in_inst2_type), 
		.IDU_in_inst2_destination_reg(IDU_in_inst2_destination_reg), 
		.IDU_in_inst2_source_reg1(IDU_in_inst2_source_reg1), 
		.IDU_in_inst2_source_reg2(IDU_in_inst2_source_reg2), 
		.AR_Status(AR_Status), 
		.MR_Status(MR_Status)
	);

	
		// Wait 100 ns for global reset to finish
		initial clk =0;
		
		always #100 clk = ~100;
   
initial begin
		// Initialize Inputs
		IDU_out_inst1_destination_reg = 0;
		IDU_out_inst2_destination_reg = 0;
		IDU_out_inst2_source_reg1 = 0;
		IDU_out_inst2_source_reg2 = 0;
		IDU_in_inst1_type = 0;
		IDU_in_inst1_destination_reg = 0;
		IDU_in_inst1_source_reg1 = 0;
		IDU_in_inst1_source_reg2 = 0;
		IDU_in_inst2_type = 0;
		IDU_in_inst2_destination_reg = 0;
		IDU_in_inst2_source_reg1 = 0;
		IDU_in_inst2_source_reg2 = 0;
		AR_Status = 0;
		MR_Status = 0;
		
#100 	IDU_in_inst1_type = ADD;
		IDU_in_inst1_destination_reg = R2;
		IDU_in_inst1_source_reg1 = R0;
		IDU_in_inst1_source_reg2 = R1;
		IDU_out_inst1_destination_reg;
	   IDU_out_inst2_destination_reg;
	   IDU_out_inst2_source_reg1;
	   IDU_out_inst2_source_reg2;
		
		
#100	IDU_in_inst2_type = ADD;
		IDU_in_inst2_destination_reg = R5;
		IDU_in_inst2_source_reg1 = R3;
		IDU_in_inst2_source_reg2 = R4;	

	
		// Add stimulus here

	end
      
endmodule

