
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"


module ADD_Res_test;

	// Inputs
	reg [7:0] Operand1;
	reg [7:0] Operand2;
	reg [2:0] Operand1_Tag;
	reg [2:0] Operand2_Tag;
	reg Operand1_Vbit;
	reg Operand2_Vbit;
	reg ADD_Status;
	reg clk;

	// Outputs
	//wire [1:0] release_pointer;
	wire [2:0] ADD_Tag_ip;
	wire AR_Status;
	wire [7:0] ADD_Operand1;
	wire [7:0] ADD_Operand2;
	wire [2:0] select;
 /*	wire [23:0] dummy_out;
	wire [7:0] dummy_out1;
	wire [7:0] dummy_out2;
	wire [7:0] dummy_out3;
	wire [7:0] dummy_out4;
	wire dummy_bit1;
	wire dummy_bit2;
	wire dummy_bit3;
	wire dummy_bit4;*/
	// Instantiate the Unit Under Test (UUT)
	ADD_Reservation_Station uut (
		//.release_pointer(release_pointer),
		/*.dummy_out(dummy_out),
		.dummy_out1(dummy_out1),
		.dummy_bit1(dummy_bit1),
		.dummy_out2(dummy_out2),
		.dummy_bit2(dummy_bit2),
		.dummy_out3(dummy_out3),
		.dummy_bit3(dummy_bit3),
		.dummy_out4(dummy_out4),
		.dummy_bit4(dummy_bit4),*/
		.ADD_Tag_ip(ADD_Tag_ip), 
		.AR_Status(AR_Status), 
		.ADD_Operand1(ADD_Operand1), 
		.ADD_Operand2(ADD_Operand2), 
		.Operand1(Operand1), 
		.Operand2(Operand2), 
		.Operand1_Tag(Operand1_Tag), 
		.Operand2_Tag(Operand2_Tag), 
		.Operand1_Vbit(Operand1_Vbit), 
		.Operand2_Vbit(Operand2_Vbit), 
		.ADD_Status(ADD_Status), 
		.clk(clk)
	);

	initial clk = 0;

	always #100 clk = ~clk;
	
	initial 
	begin
	
	#400  ADD_Status= 1'b1;				//400
	      Operand1 = `sanity;
			Operand2 = `sanity;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b0;
			Operand2_Vbit = 1'b0;
	
	#100  ADD_Status= 1'b0;				//500
	      Operand1 = `R3;
			Operand2 = `R4;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b1;
			Operand2_Vbit = 1'b1;
	
	#100  ADD_Status= 1'b0;			//600
	      Operand1 = `R6;
			Operand2 = `R7;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b1;
			Operand2_Vbit = 1'b1;
			
	#100  ADD_Status= 1'b0;				//700
	      Operand1 = `R9;
			Operand2 = `R10;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b1;
			Operand2_Vbit = 1'b1;
	
	#100  ADD_Status= 1'b0;				//800
	      Operand1 = `sanity;
			Operand2 = `sanity;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b0;
			Operand2_Vbit = 1'b0;
			
	#100  ADD_Status= 1'b0;				//900
	      Operand1 = `R15;
			Operand2 = `R16;
			Operand1_Tag = 3'bz;
			Operand2_Tag = 3'bz;
			Operand1_Vbit = 1'b1;
			Operand2_Vbit = 1'b1;
			
	#400  ADD_Status= 1'b0;				//1300
	
	#100  ADD_Status= 1'b1;				//1400
	
	#100  ADD_Status= 1'b0;				//900
	
	#100  ADD_Status= 1'b1;				//900
	
	#100  ADD_Status= 1'b0;				//900
	
	#100  ADD_Status= 1'b1;				//900
	end

      
endmodule

