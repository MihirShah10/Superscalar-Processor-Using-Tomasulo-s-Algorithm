`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"


module MUL_Res_test;

	// Inputs
	reg [7:0] Operand3;
	reg [7:0] Operand4;
	reg [2:0] Operand3_Tag;
	reg [2:0] Operand4_Tag;
	reg Operand3_Vbit;
	reg Operand4_Vbit;
	reg MUL_Status;
	reg clk;

	// Outputs
	wire [2:0] MUL_Tag_ip;
	wire MR_Status;
	wire [7:0] MUL_Operand3;
	wire [7:0] MUL_Operand4;

	// Instantiate the Unit Under Test (UUT)
	MUL_Reservation_Station uut (
		.MUL_Tag_ip(MUL_Tag_ip), 
		.MR_Status(MR_Status), 
		.MUL_Operand3(MUL_Operand3), 
		.MUL_Operand4(MUL_Operand4), 
		.Operand3(Operand3), 
		.Operand4(Operand4), 
		.Operand3_Tag(Operand3_Tag), 
		.Operand4_Tag(Operand4_Tag), 
		.Operand3_Vbit(Operand3_Vbit), 
		.Operand4_Vbit(Operand4_Vbit), 
		.MUL_Status(MUL_Status), 
		.clk(clk)
	);
initial clk=0;

always #100 clk=~clk;

	initial begin
	
		// Wait 100 ns for global reset to finish
		#100  MUL_Status= 1'b0;				//400
	      Operand3 = `R0;
			Operand4 = `R1;
			Operand3_Tag = 3'bz;
			Operand4_Tag = 3'bz;
			Operand3_Vbit = 1'b1;
			Operand4_Vbit = 1'b1;
	
	#200  MUL_Status= 1'b0;				//500
	      Operand3 = `R12;
			Operand4 = `R13;
			Operand3_Tag = 3'bz;
			Operand4_Tag = 3'bz;
			Operand3_Vbit = 1'b1;
			Operand4_Vbit = 1'b1;
        
		// Add stimulus here

	end
      
endmodule

