
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Instruction_Queue(
inst1_type, 
inst1_destination_reg, 
inst1_source_reg1, 
inst1_source_reg2, 
inst2_type, 
inst2_destination_reg, 
inst2_source_reg1, 
inst2_source_reg2,
clock_count, 
select_instruction, 
clk);


output [7:0] inst1_type;
output [7:0] inst1_destination_reg;
output [7:0] inst1_source_reg1;
output [7:0] inst1_source_reg2;

output [7:0] inst2_type;
output [7:0] inst2_destination_reg;
output [7:0] inst2_source_reg1;
output [7:0] inst2_source_reg2;

output reg [4:0] clock_count = 5'b0;

//input [7:0] program_counter;
input clk;
input [1:0] select_instruction;

reg [7:0] inst1_type;
reg [7:0] inst1_destination_reg;
reg [7:0] inst1_source_reg1;
reg [7:0] inst1_source_reg2;

reg [7:0] inst2_type;
reg [7:0] inst2_destination_reg;
reg [7:0] inst2_source_reg1;
reg [7:0] inst2_source_reg2;
reg [31:0] ROM_Code [1023:0];          // 4 KB of Program ROM

reg [7:0] program_counter;
wire clk;
wire [1:0] select_instruction;



// Program
initial
begin
program_counter = 8'b0;
ROM_Code [0] = {`MUL, `R2, `R0, `R1};
ROM_Code [1] = {`ADD, `R5, `R3, `R4};
ROM_Code [2] = {`ADD, `R8, `R6, `R7};
ROM_Code [3] = {`ADD, `R11, `R9, `R10};
ROM_Code [4] = {`MUL, `R14, `R12, `R13};
ROM_Code [5] = {`ADD, `R17, `R15, `R16};
//inst1_type = `MUL;
//inst2_type = `ADD;
end



always @(posedge clk)
begin
	
	
			if (program_counter == 8'b0)
			begin
					inst1_type = ROM_Code[program_counter][31:24];
					inst1_destination_reg = ROM_Code[program_counter][23:16];
					inst1_source_reg1 = ROM_Code[program_counter][15:8];
					inst1_source_reg2 = ROM_Code[program_counter][7:0];
					
					program_counter = program_counter + 1;
					
			end
			
			else
			begin
				case (select_instruction)
				
					2'b00 : program_counter = program_counter;
					
					2'b01 : 	begin
								inst1_type = ROM_Code[program_counter][31:24];
								inst1_destination_reg = ROM_Code[program_counter][23:16];
								inst1_source_reg1 = ROM_Code[program_counter][15:8];
								inst1_source_reg2 = ROM_Code[program_counter][7:0];
								
								program_counter = program_counter + 1;
								end
				
					2'b10 : 	begin
								inst1_type = ROM_Code[program_counter][31:24];
								inst1_destination_reg = ROM_Code[program_counter][23:16];
								inst1_source_reg1 = ROM_Code[program_counter][15:8];
								inst1_source_reg2 = ROM_Code[program_counter][7:0];
					
								program_counter = program_counter + 1;
								end
			
				endcase
			end
end


always @(negedge clk)
begin
		if(clock_count >= 5'b00010)
		begin
			if (program_counter == 8'b1)
			begin
					inst2_type = ROM_Code[program_counter][31:24];
					inst2_destination_reg = ROM_Code[program_counter][23:16];
					inst2_source_reg1 = ROM_Code[program_counter][15:8];
					inst2_source_reg2 = ROM_Code[program_counter][7:0];
					
					program_counter = program_counter + 1;
			end
			
			else
			begin
				case (select_instruction)
				
					2'b00 : program_counter = program_counter;
				
					2'b10 : 	begin
								
								inst2_type = ROM_Code[program_counter][31:24];
								inst2_destination_reg = ROM_Code[program_counter][23:16];
								inst2_source_reg1 = ROM_Code[program_counter][15:8];
								inst2_source_reg2 = ROM_Code[program_counter][7:0];
								
								program_counter = program_counter + 1;
								end
			
				endcase
			end
		end
end

always @(clk)
begin
	clock_count = clock_count + 1;
end

endmodule
