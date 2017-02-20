
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Test_IDU;

	// Inputs
	reg [7:0] IDU_in_inst1_type;
	reg [7:0] IDU_in_inst1_destination_reg1;
	reg [7:0] IDU_in_inst1_source_reg1;
	reg [7:0] IDU_in_inst1_source_reg2;
	reg [7:0] IDU_in_inst2_type;
	reg [7:0] IDU_in_inst2_destination_reg2;
	reg [7:0] IDU_in_inst2_source_reg3;
	reg [7:0] IDU_in_inst2_source_reg4;
	reg AR_Status;
	reg MR_Status;
   reg clk;
	// Outputs
	//wire [3:0] pos_count;
	//wire [3:0] neg_count;
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
	IDU uut (
		.select_instruction(select_instruction), 
		.IDU_out_inst1_type(IDU_out_inst1_type), 
		.IDU_out_inst1_destination_reg1(IDU_out_inst1_destination_reg1), 
		.IDU_out_inst1_source_reg1(IDU_out_inst1_source_reg1), 
		.IDU_out_inst1_source_reg2(IDU_out_inst1_source_reg2), 
		.IDU_out_inst2_type(IDU_out_inst2_type), 
		.IDU_out_inst2_destination_reg2(IDU_out_inst2_destination_reg2), 
		.IDU_out_inst2_source_reg3(IDU_out_inst2_source_reg3), 
		.IDU_out_inst2_source_reg4(IDU_out_inst2_source_reg4), 
		.IDU_in_inst1_type(IDU_in_inst1_type), 
		.IDU_in_inst1_destination_reg1(IDU_in_inst1_destination_reg1), 
		.IDU_in_inst1_source_reg1(IDU_in_inst1_source_reg1), 
		.IDU_in_inst1_source_reg2(IDU_in_inst1_source_reg2), 
		.IDU_in_inst2_type(IDU_in_inst2_type), 
		.IDU_in_inst2_destination_reg2(IDU_in_inst2_destination_reg2), 
		.IDU_in_inst2_source_reg3(IDU_in_inst2_source_reg3), 
		.IDU_in_inst2_source_reg4(IDU_in_inst2_source_reg4), 
		.AR_Status(AR_Status), 
		.MR_Status(MR_Status),
		.clk(clk)
	);
	
	initial clk = 0;
	
	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		IDU_in_inst1_type = 0;
		IDU_in_inst1_destination_reg1 = 0;
		IDU_in_inst1_source_reg1 = 0;
		IDU_in_inst1_source_reg2 = 0;
		IDU_in_inst2_type = 0;
		IDU_in_inst2_destination_reg2 = 0;
		IDU_in_inst2_source_reg3 = 0;
		IDU_in_inst2_source_reg4 = 0;
		AR_Status = 1;
		MR_Status = 1;

		// Wait 100 ns for global reset to finish
 #100 IDU_in_inst1_type = `MUL;
		IDU_in_inst1_destination_reg1 = `R2;
		IDU_in_inst1_source_reg1 = `R0;
		IDU_in_inst1_source_reg2 = `R1;
		AR_Status = 0;
		MR_Status = 0;
		
 #100	IDU_in_inst2_type = `ADD;
		IDU_in_inst2_destination_reg2 = `R5;
		IDU_in_inst2_source_reg3 = `R3;
		IDU_in_inst2_source_reg4 = `R4;
		AR_Status = 0;
		MR_Status = 0;
		
 #100 IDU_in_inst1_type = `ADD;								//300
		IDU_in_inst1_destination_reg1 = `R8;
		IDU_in_inst1_source_reg1 = `R6;
		IDU_in_inst1_source_reg2 = `R7;
		AR_Status = 0;
		MR_Status = 0;
		
 #100	IDU_in_inst2_type = `ADD;								//400
		IDU_in_inst2_destination_reg2 = `R11;
		IDU_in_inst2_source_reg3 = `R9;
		IDU_in_inst2_source_reg4 = `R10;
		AR_Status = 0;
		MR_Status = 0;

 #100 IDU_in_inst1_type = `MUL;								//500
		IDU_in_inst1_destination_reg1 = `R14;
		IDU_in_inst1_source_reg1 = `R12;
		IDU_in_inst1_source_reg2 = `R13;
		AR_Status = 0;
		MR_Status = 0;
		
 #100	IDU_in_inst2_type = `ADD;								//600
		IDU_in_inst2_destination_reg2 = `R17;
		IDU_in_inst2_source_reg3 = `R15;
		IDU_in_inst2_source_reg4 = `R16;
		AR_Status = 0;
		MR_Status = 0;	
        
/*#200  IDU_in_inst1_type = `MUL;
		IDU_in_inst1_destination_reg1 = `R14;
		IDU_in_inst1_source_reg1 = `R12;
		IDU_in_inst1_source_reg2 = `R13;
		IDU_in_inst2_type = `ADD;
		IDU_in_inst2_destination_reg2 = `R17;
		IDU_in_inst2_source_reg3 = `R15;
		IDU_in_inst2_source_reg4 = `R16;
		AR_Status = 0;
		MR_Status = 0;		// Add stimulus here
*/
end
      
endmodule

