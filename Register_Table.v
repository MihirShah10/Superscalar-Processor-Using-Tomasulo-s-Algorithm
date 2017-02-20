
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

`define g 1'b1
`define h 3'bz

module Register_Table(
//UP1,
//UP2,
Operand1, 
Operand2, 
Operand3, 
Operand4, 
Operand1_Tag, 
Operand2_Tag, 
Operand3_Tag, 
Operand4_Tag, 
Operand1_Vbit, 
Operand2_Vbit, 
Operand3_Vbit, 
Operand4_Vbit, 
inst1_type, 
inst2_type, 
Source_Reg1, 
Source_Reg2, 
Source_Reg3, 
Source_Reg4, 
Dest_Reg1, 
Dest_Reg2, 
ADD_Tag_op, 
MUL_Tag_op, 
ADD_Tag_ip, 
MUL_Tag_ip, 
MUL_Output,
ADD_Output, 
clock_count, 
clk);

//output reg [19:0] UP1;
//output reg [19:0] UP2;
output reg [7:0] Operand1;
output reg [7:0] Operand2;
output reg [7:0] Operand3;
output reg [7:0] Operand4;
output reg [2:0] Operand1_Tag;
output reg [2:0] Operand2_Tag;
output reg [2:0] Operand3_Tag;
output reg [2:0] Operand4_Tag;
output reg Operand1_Vbit;
output reg Operand2_Vbit;
output reg Operand3_Vbit;
output reg Operand4_Vbit;

//output reg [7:0] var3;
//output reg [7:0] var6;

input wire [7:0] inst1_type;
input wire [7:0] inst2_type;

input wire [7:0] Source_Reg1;
input wire [7:0] Source_Reg2;
input wire [7:0] Source_Reg3;
input wire [7:0] Source_Reg4;
input wire [7:0] Dest_Reg1;
input wire [7:0] Dest_Reg2;
input wire [2:0] ADD_Tag_op;
input wire [2:0] MUL_Tag_op;
input wire [2:0] ADD_Tag_ip;
input wire [2:0] MUL_Tag_ip;
input wire [7:0] ADD_Output;
input wire [7:0] MUL_Output;
input wire [4:0] clock_count;
input wire clk;

reg [7:0] inst2_type_new;
reg [7:0] current_inst2_type;
reg [7:0] previous_inst2_type =`ADD;
reg [19:0] register_array [17:0];
integer i;

initial
begin
		register_array [0]  = {`R0, 1'b1, 3'bz, 8'b00000000};
		register_array [1]  = {`R1, 1'b1, 3'bz, 8'b00000001};
		register_array [2]  = {`R2, 1'b1, 3'bz, 8'b00000010};
		register_array [3]  = {`R3, 1'b1, 3'bz, 8'b00000011};
		register_array [4]  = {`R4, 1'b1, 3'bz, 8'b00000100};
		register_array [5]  = {`R5, 1'b1, 3'bz, 8'b00000101};
		register_array [6]  = {`R6, 1'b1, 3'bz, 8'b00000110};
		register_array [7]  = {`R7, 1'b1, 3'bz, 8'b00000111};
		register_array [8]  = {`R8, 1'b1, 3'bz, 8'b00001000};
		register_array [9]  = {`R9, 1'b1, 3'bz, 8'b00001001};
		register_array [10] = {`R10, 1'b1, 3'bz, 8'b00001010};
		register_array [11] = {`R11, 1'b1, 3'bz, 8'b00001011};
		register_array [12] = {`R12, 1'b1, 3'bz, 8'b00001100};
		register_array [13] = {`R13, 1'b1, 3'bz, 8'b00001101};
		register_array [14] = {`R14, 1'b1, 3'bz, 8'b00001110};
		register_array [15] = {`R15, 1'b1, 3'bz, 8'b00001111};
		register_array [16] = {`R16, 1'b1, 3'bz, 8'b00010000};
		register_array [17] = {`R17, 1'b1, 3'bz, 8'b00010001};
end
 
		
/*
always @(negedge clk)

begin
   current_inst2_type=inst2_type; 
	if(previous_inst2_type != current_inst2_type)
	begin
		inst2_type_new = current_inst2_type;
	end	
	else
	   inst2_type_new = inst2_type;
end 

always @(posedge clk)
begin
	if (inst1_type == `ADD)
	begin

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg1 == register_array[i] [19:12])
				begin
						Operand1 = register_array[i] [7:0];
						Operand3 = 8'b11111111;
				end
				
				if (register_array[i][19:12] == Dest_Reg1) 
				begin
							register_array[i][11] = 1'b0;
							register_array[i][10:8] = ADD_Tag_ip;
							register_array[i][7:0] = 8'bz;
				end
				
				if (register_array[i][10:8] == ADD_Tag_op)
				begin
							register_array[i][11] = 1'b1;
							register_array[i][7:0] = ADD_Output;
							register_array[i][10:8] = 3'bz;
				end
			end

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg2 == register_array[i] [19:12])
				begin
						Operand2 = register_array[i] [7:0];
						Operand4 = 8'b11111111;
				end
			end
	end
	
end


always @(negedge clk)
begin

		if (inst2_type_new == `MUL)
		previous_inst2_type = `MUL;
		begin
			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg3 == register_array[i] [19:12])
					begin
							Operand3 = register_array[i] [7:0];
							Operand1 = 8'b11111111;
					end
					
					if (register_array[i][19:12] == Dest_Reg2) 
					begin
								register_array[i][11] = 1'b0;
								register_array[i][10:8] = MUL_Tag_ip;
								register_array[i][7:0] = 8'bz;
					end
					
					if (register_array[i][10:8] == MUL_Tag_op)
					begin
								register_array[i][11] = 1'b1;
								register_array[i][7:0] = MUL_Output;
								register_array[i][10:8] = 3'bz;
					end
				end

			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg4 == register_array[i] [19:12])
					begin
							Operand4 = register_array[i] [7:0];
							Operand2 = 8'b11111111;
					end
				end
		
		end
	
end

always @(negedge clk)
begin
	
		if (inst1_type == `ADD)
		begin
			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg1 == register_array[i] [19:12])
					begin
							Operand1 = register_array[i] [7:0];
							Operand3 = 8'b11111111;
					end
					
					if (register_array[i][19:12] == Dest_Reg1) 
					begin
								register_array[i][11] = 1'b0;
								register_array[i][10:8] = ADD_Tag_ip;
								register_array[i][7:0] = 8'bz;
					end
					
					if (register_array[i][10:8] == ADD_Tag_op)
					begin
								register_array[i][11] = 1'b1;
								register_array[i][7:0] = ADD_Output;
								register_array[i][10:8] = 3'bz;
					end
				end

			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg2 == register_array[i] [19:12])
					begin
							Operand2 = register_array[i] [7:0];
							Operand4 = 8'b11111111;
					end
				end
		end
		
end




































*/
/*
always @(posedge clk)
begin
	if (inst1_type == `ADD)
	begin

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg1 == register_array[i] [19:12])
				begin
						Operand1 = register_array[i] [7:0];
						Operand3 = 8'b11111111;
				end
				
				if (register_array[i][19:12] == Dest_Reg1) 
				begin
							register_array[i][11] = 1'b0;
							register_array[i][10:8] = ADD_Tag_ip;
							register_array[i][7:0] = 8'bz;
				end
				
				if (register_array[i][10:8] == ADD_Tag_op)
				begin
							register_array[i][11] = 1'b1;
							register_array[i][7:0] = ADD_Output;
							register_array[i][10:8] = 3'bz;
				end
			end

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg2 == register_array[i] [19:12])
				begin
						Operand2 = register_array[i] [7:0];
						Operand4 = 8'b11111111;
				end
			end
	end
	
end


always @(negedge clk)
begin

		if (inst2_type == `MUL)
		begin
			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg3 == register_array[i] [19:12])
					begin
							Operand3 = register_array[i] [7:0];
							Operand1 = 8'b11111111;
					end
					
					if (register_array[i][19:12] == Dest_Reg2) 
					begin
								register_array[i][11] = 1'b0;
								register_array[i][10:8] = MUL_Tag_ip;
								register_array[i][7:0] = 8'bz;
					end
					
					if (register_array[i][10:8] == MUL_Tag_op)
					begin
								register_array[i][11] = 1'b1;
								register_array[i][7:0] = MUL_Output;
								register_array[i][10:8] = 3'bz;
					end
				end

			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg4 == register_array[i] [19:12])
					begin
							Operand4 = register_array[i] [7:0];
							Operand2 = 8'b11111111;
					end
				end
		
		end
	
end

always @(negedge clk)
begin
	
		if (inst1_type == `ADD)
		begin
			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg1 == register_array[i] [19:12])
					begin
							Operand1 = register_array[i] [7:0];
							Operand3 = 8'b11111111;
					end
					
					if (register_array[i][19:12] == Dest_Reg1) 
					begin
								register_array[i][11] = 1'b0;
								register_array[i][10:8] = ADD_Tag_ip;
								register_array[i][7:0] = 8'bz;
					end
					
					if (register_array[i][10:8] == ADD_Tag_op)
					begin
								register_array[i][11] = 1'b1;
								register_array[i][7:0] = ADD_Output;
								register_array[i][10:8] = 3'bz;
					end
				end

			for ( i = 0; i<=17; i = i+1)
				begin
					if (Source_Reg2 == register_array[i] [19:12])
					begin
							Operand2 = register_array[i] [7:0];
							Operand4 = 8'b11111111;
					end
				end
		end
		
end

*/
/*
always @(clk)

begin
	for (i=0;i<=17;i=i+1)
			begin
			if (register_array[4][10:8]==ADD_Tag_op)
				begin
				register_array[4][7:0]=ADD_Output;
				UP1=register_array[4][19:0];
				end
	end
end

always @(clk)

begin
	for (i=0;i<=17;i=i+1)
			begin
			if (register_array[i][10:8]==MUL_Tag_op)
				begin
				register_array[i][7:0]=MUL_Output;
				UP2=register_array[i][19:0];
				end
	end
end */

always @(clk)
begin


	if (inst1_type == `ADD && (clock_count == 5'b00101 || clock_count == 5'b00110 || clock_count == 5'b00111 || clock_count == 5'b01001))
	begin

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg1 == register_array[i] [19:12])
				begin
						Operand1 = register_array[i] [7:0];
						Operand1_Vbit= register_array[i] [11];
						Operand3 = `sanity;
				end
				
				if (register_array[i][19:12] == Dest_Reg1) 
				begin
							register_array[i][11] = 1'b0;
							register_array[i][10:8] = ADD_Tag_ip;
							register_array[i][7:0] = 8'bz;
				end
				
				if (register_array[i][10:8] == ADD_Tag_op)
				begin
							register_array[i][11] = 1'b1;
							register_array[i][7:0] = ADD_Output;
							register_array[i][10:8] = 3'bz;
				end
			end

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg2 == register_array[i] [19:12])
				begin
						Operand2 = register_array[i] [7:0];
						Operand2_Vbit= register_array[i] [11];
						Operand4 = `sanity;
				end
			end
	end
	
	
	else if (inst2_type == `MUL && (clock_count == 5'b00100 || clock_count == 5'b01000 ))
	begin

		for ( i = 0; i<=17; i = i+1)
			begin
				if (Source_Reg3 == register_array[i] [19:12])
				begin
						Operand3 = register_array[i] [7:0];
						Operand3_Vbit= register_array[i] [11];
						Operand1 = `sanity;
				end
				
				if (Source_Reg4 == register_array[i] [19:12])
				begin
						Operand4 = register_array[i] [7:0];
						Operand4_Vbit= register_array[i] [11]; 
						Operand2 = `sanity;
				end
			end
	end
	
end

endmodule
