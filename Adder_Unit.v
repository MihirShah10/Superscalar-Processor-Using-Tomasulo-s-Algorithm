
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Adder_Unit(
count, 
ADD_Status,
 ADD_Output,
 ADD_Tag_op,
 ADD_Tag_ip,
 ADD_Operand1,
 ADD_Operand2,
 clk
 );

output reg ADD_Status;
output reg [7:0] ADD_Output;
output reg [2:0] ADD_Tag_op;

output reg [2:0] count=3'b0;
reg [2:0] i;

input wire [2:0] ADD_Tag_ip;
input wire [7:0] ADD_Operand1;
input wire [7:0] ADD_Operand2;
input wire clk;

//integer count1;
//integer count2;
reg [7:0] Source_array1 [3:0];
reg [7:0] Source_array2 [3:0];
reg [7:0] ADD_Buffer;

always @(clk)
	begin
			case (count)
			
			3'b000 : 		begin
						//ADD_Buffer = ADD_Operand1 + ADD_Operand2;
						ADD_Status = 1'b1;
						count = count+1;
						ADD_Output=8'bz;
						ADD_Tag_op=3'bz;
						end
			
			3'b001 : 		begin
						//ADD_Buffer = ADD_Operand1 + ADD_Operand2;
						ADD_Status = 1'b0;
						ADD_Output = ADD_Operand1 + ADD_Operand2;
						ADD_Output = ADD_Buffer;
						ADD_Tag_op = ADD_Tag_ip;
						count = count+1;
					
						end
						
			3'b010 : 		begin
						
						ADD_Status = 1'b1;
						//ADD_Buffer = ADD_Operand1 + ADD_Operand2;
						
						ADD_Output=8'bz;
						ADD_Tag_op=3'bz;
						count = count+1;
						end
			
			3'b011 : 		begin
					   ADD_Buffer = ADD_Operand1 + ADD_Operand2;
						count = 3'b0;
						ADD_Status = 1'b1;
						ADD_Output=8'bz;
                  ADD_Tag_op=3'bz;
						end
			
			endcase
	end
	

endmodule
