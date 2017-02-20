`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Reg_Table_test;

	// Inputs
	reg [7:0] inst1_type;
	reg [7:0] inst2_type;
	reg [7:0] Source_Reg1;
	reg [7:0] Source_Reg2;
	reg [7:0] Source_Reg3;
	reg [7:0] Source_Reg4;
	reg [7:0] Dest_Reg1;
	reg [7:0] Dest_Reg2;
	reg [2:0] ADD_Tag_op;
	reg [2:0] MUL_Tag_op;
	reg [2:0] ADD_Tag_ip;
	reg [2:0] MUL_Tag_ip;
	reg [7:0] ADD_Output;
	reg [7:0] MUL_Output;
	reg [4:0] clock_count;
	reg clk;

	// Outputs
	//wire [19:0] UP1;
	//wire [19:0] UP2;
	wire [7:0] Operand1;
	wire [7:0] Operand2;
	wire [7:0] Operand3;
	wire [7:0] Operand4;
	wire [2:0] Operand1_Tag;
	wire [2:0] Operand2_Tag;
	wire [2:0] Operand3_Tag;
	wire [2:0] Operand4_Tag;
	wire Operand1_Vbit;
	wire Operand2_Vbit;
	wire Operand3_Vbit;
	wire Operand4_Vbit;

	// Instantiate the Unit Under Test (UUT)
	Register_Table uut (
		//.UP1(UP1), 
		//.UP2(UP2), 
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.Operand3(Operand3), 
		.Operand4(Operand4), 
		.Operand1_Tag(Operand1_Tag), 
		.Operand2_Tag(Operand2_Tag), 
		.Operand3_Tag(Operand3_Tag), 
		.Operand4_Tag(Operand4_Tag), 
		.Operand1_Vbit(Operand1_Vbit), 
		.Operand2_Vbit(Operand2_Vbit), 
		.Operand3_Vbit(Operand3_Vbit), 
		.Operand4_Vbit(Operand4_Vbit), 
		.inst1_type(inst1_type), 
		.inst2_type(inst2_type), 
		.Source_Reg1(Source_Reg1), 
		.Source_Reg2(Source_Reg2), 
		.Source_Reg3(Source_Reg3), 
		.Source_Reg4(Source_Reg4), 
		.Dest_Reg1(Dest_Reg1), 
		.Dest_Reg2(Dest_Reg2), 
		.ADD_Tag_op(ADD_Tag_op), 
		.MUL_Tag_op(MUL_Tag_op), 
		.ADD_Tag_ip(ADD_Tag_ip), 
		.MUL_Tag_ip(MUL_Tag_ip), 
		.ADD_Output(ADD_Output), 
		.MUL_Output(MUL_Output), 
		.clock_count(clock_count), 
		.clk(clk)
	);

	initial clk = 0;

	always #100 clk = ~clk;

	initial begin
		// Initialize Inputs
		inst1_type = 0;
		inst2_type = 0;
		Source_Reg1 = 0;
		Source_Reg2 = 0;
		Source_Reg3 = 0;
		Source_Reg4 = 0;
		Dest_Reg1 = 0;
		Dest_Reg2 = 0;
		ADD_Tag_op = 0;
		MUL_Tag_op = 0;
		ADD_Tag_ip = 0;
		MUL_Tag_ip = 0;
		ADD_Output = 0;
		MUL_Output = 0;
		

		// Wait 100 ns for global reset to finish
		#300  inst2_type = `MUL;
				Source_Reg3 = `R0;
				Source_Reg4 = `R1;				
				Dest_Reg2 = `R2;
				clock_count = 5'b00100;
		
		#100	inst1_type = `ADD;
				Source_Reg1 = `R3;
				Source_Reg2 = `R4;				
				Dest_Reg1 = `R5;
				ADD_Tag_ip = `b;
				MUL_Tag_ip = `w;
				clock_count = 5'b00101;
				
		#100  inst1_type = `ADD;				
				Source_Reg1 = `R6;
				Source_Reg2 = `R7;
				Dest_Reg1 = `R8;
		      clock_count = 5'b00110; 
		#100	inst1_type = `ADD;
				Source_Reg1 = `R9;
				Source_Reg2 = `R10;				
				Dest_Reg1 = `R11;
				ADD_Tag_ip = `b;
				MUL_Tag_ip = `w;
				clock_count = 5'b00111;
				
		#100  inst2_type = `MUL;				
				Source_Reg3 = `R12;
				Source_Reg4 = `R13;
				Dest_Reg2 = `R14;
				clock_count = 5'b01000; 
				
		#100	inst1_type = `ADD;
				Source_Reg1 = `R16;
				Source_Reg2 = `R15;				
				Dest_Reg1 = `R17;
				ADD_Tag_ip = `b;
				MUL_Tag_ip = `w;
				clock_count = 5'b01001;
		/*#100  inst1_type = `MUL;				
				Source_Reg3 = `R1;
				Source_Reg4 = `R2;
				Dest_Reg1 = `R3;
				
		#100	inst2_type = `MUL;	
				Source_Reg3 = `R4;
				Source_Reg4 = `R4;				
				Dest_Reg2 = `R3;
				ADD_Tag_ip = `b;
				MUL_Tag_ip = `w;
				
		#800 	ADD_Output = 8'b00000011;
				ADD_Tag_op = `b;
				
		#400	MUL_Output = 8'b00010100;
				MUL_Tag_op = `w; */

	end
      
endmodule

