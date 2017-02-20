
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module IDU(
select_instruction,
IDU_out_inst1_type,
IDU_out_inst1_destination_reg1,
IDU_out_inst1_source_reg1,
IDU_out_inst1_source_reg2,
IDU_out_inst2_type,
IDU_out_inst2_destination_reg2,
IDU_out_inst2_source_reg3,
IDU_out_inst2_source_reg4,
IDU_in_inst1_type,
IDU_in_inst1_destination_reg1,
IDU_in_inst1_source_reg1,
IDU_in_inst1_source_reg2,
IDU_in_inst2_type,
IDU_in_inst2_destination_reg2,
IDU_in_inst2_source_reg3,
IDU_in_inst2_source_reg4,
AR_Status,
MR_Status,
clock_count_in,
clk);

output reg [1:0] select_instruction = 2'b10;

output reg [7:0] IDU_out_inst1_type;
output reg [7:0] IDU_out_inst1_destination_reg1;
output reg [7:0] IDU_out_inst1_source_reg1;
output reg [7:0] IDU_out_inst1_source_reg2;

output reg [7:0] IDU_out_inst2_type;
output reg [7:0] IDU_out_inst2_destination_reg2;
output reg [7:0] IDU_out_inst2_source_reg3;
output reg [7:0] IDU_out_inst2_source_reg4;
  
		
input wire [7:0] IDU_in_inst1_type;
input wire [7:0] IDU_in_inst1_destination_reg1;
input wire [7:0] IDU_in_inst1_source_reg1;
input wire [7:0] IDU_in_inst1_source_reg2;

input wire [7:0] IDU_in_inst2_type;
input wire [7:0] IDU_in_inst2_destination_reg2;
input wire [7:0] IDU_in_inst2_source_reg3;
input wire [7:0] IDU_in_inst2_source_reg4;

input wire AR_Status;
input wire MR_Status;
input wire [4:0] clock_count_in;
input wire clk;
 
//output integer pos_count = 0;
//output integer neg_count = 0;

always @(posedge clk)
begin

			if(AR_Status == 1'b1 || MR_Status == 1'b1)
				select_instruction = 2'b00;
			else
				begin
				select_instruction = 2'b10;
				if (IDU_in_inst1_type == `ADD)
					begin
						IDU_out_inst1_type = IDU_in_inst1_type;
						IDU_out_inst1_destination_reg1 = IDU_in_inst1_destination_reg1;
						IDU_out_inst1_source_reg1 = IDU_in_inst1_source_reg1;
						IDU_out_inst1_source_reg2 = IDU_in_inst1_source_reg2;
					end
					
				else if (IDU_in_inst1_type == `MUL)
							begin
								IDU_out_inst2_type = IDU_in_inst1_type;
								IDU_out_inst2_destination_reg2 = IDU_in_inst1_destination_reg1;
								IDU_out_inst2_source_reg3 = IDU_in_inst1_source_reg1;
								IDU_out_inst2_source_reg4 = IDU_in_inst1_source_reg2;
							end		
				end
end




always @(negedge clk)
begin
			if(AR_Status == 1'b1 || MR_Status == 1'b1)
				select_instruction = 2'b00;
				
			else 
			begin
				if (IDU_in_inst2_type == `ADD)
				begin
					IDU_out_inst1_type = IDU_in_inst2_type;
					IDU_out_inst1_destination_reg1 = IDU_in_inst2_destination_reg2;
					IDU_out_inst1_source_reg1 = IDU_in_inst2_source_reg3;
					IDU_out_inst1_source_reg2 = IDU_in_inst2_source_reg4;
				end
				
				else if (IDU_in_inst1_type == `MUL)
						begin
							IDU_out_inst2_type = IDU_in_inst2_type;
							IDU_out_inst2_destination_reg2 = IDU_in_inst2_destination_reg2;
							IDU_out_inst2_source_reg3 = IDU_in_inst2_source_reg3;
							IDU_out_inst2_source_reg4 = IDU_in_inst2_source_reg4;
						end
			end


end

endmodule
