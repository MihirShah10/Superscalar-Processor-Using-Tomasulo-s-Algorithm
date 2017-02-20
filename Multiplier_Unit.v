
/*`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Multiplier_Unit(count2, MUL_Status, MUL_Output, MUL_Tag_op, MUL_Tag_ip, MUL_Operand3, MUL_Operand4, clk);

output reg MUL_Status;
output reg [7:0] MUL_Output;
output reg [2:0] MUL_Tag_op;

output reg [2:0] count2=3'b0;

input wire [2:0] MUL_Tag_ip;
input wire [7:0] MUL_Operand3;
input wire [7:0] MUL_Operand4;
input wire clk;


always @(posedge clk)
	begin
			case (count2)
			
			3'b000 : begin
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			
			3'b001 : begin
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
						
			3'b010 : begin
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			
			3'b011 : begin
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
						
			3'b100 : begin
						MUL_Status = 1'b0;
						MUL_Output = MUL_Operand3 * MUL_Operand4;
						MUL_Tag_op = MUL_Tag_ip;
						count2 = count2+1;
						end
			
			3'b101 : begin
						count2 = 3'b0;
						MUL_Status = 1'b1;
						MUL_Output=8'bz;
                  MUL_Tag_op=3'bz;
						end
			
			
			endcase
	end

endmodule
*/


`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module Multiplier_Unit(
count2, 
MUL_Status,
 MUL_Output,
 MUL_Tag_op,
 MUL_Tag_ip,
 MUL_Operand3,
 MUL_Operand4,
 clk
 );


output reg MUL_Status;
output reg [7:0] MUL_Output;
output reg [2:0] MUL_Tag_op;

output reg [2:0] count2=3'b0;
reg [2:0] i;

input wire [2:0] MUL_Tag_ip;
input wire [7:0] MUL_Operand3;
input wire [7:0] MUL_Operand4;
input wire clk;

//integer count21;
//integer count22;
reg [7:0] Source_array1 [3:0];
reg [7:0] Source_array2 [3:0];
reg [7:0] MUL_Buffer;

always @(clk)

			case (count2)
			
			3'b000 : 		begin
						//MUL_Buffer = MUL_Operand3 + MUL_Operand4;
				//	   MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			
			3'b001 : 		begin
						MUL_Output = MUL_Operand3 * MUL_Operand4;
						MUL_Output=MUL_Buffer;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
					
						end
						
			3'b010 : 		begin
						
			//		   MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			3'b011 : 		begin
						
					//   MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			3'b100 : 		begin
						
					 //  MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;

						end
		3'b101 : 		begin
						
						MUL_Status = 1'b0;
						count2 = count2+1;
						MUL_Status = 1'b0;
						MUL_Output = MUL_Operand3 * MUL_Operand4;
						MUL_Output=MUL_Buffer;
						MUL_Tag_op=MUL_Tag_ip;						end
			
		3'b110 : 		begin
					 //  MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
						
	3'b111 : 		begin
						MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						MUL_Status = 1'b1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						count2 = 3'b0;
						end
						
						
			endcase
	
	/*
always @(clk)
	begin
			case (count2)
			
			3'b000 : 		begin
						//MUL_Buffer = MUL_Operand3 + MUL_Operand4;
						MUL_Status = 1'b1;
						count2 = count2+1;
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						end
			
			3'b001 : 		begin
						//MUL_Buffer = MUL_Operand3 + MUL_Operand4;
						MUL_Status = 1'b0;
						MUL_Output = MUL_Operand3 * MUL_Operand4;
						MUL_Output = MUL_Buffer;
						MUL_Tag_op = MUL_Tag_ip;
						count2 = count2+1;
					
						end
						
			3'b010 : 		begin
						
						MUL_Status = 1'b1;
						//MUL_Buffer = MUL_Operand3 + MUL_Operand4;
						
						MUL_Output=8'bz;
						MUL_Tag_op=3'bz;
						count2 = count2+1;
						end
			
			3'b011 : 		begin
					   MUL_Buffer = MUL_Operand3 * MUL_Operand4;
						count2 = 3'b0;
						MUL_Status = 1'b1;
						MUL_Output=8'bz;
                  MUL_Tag_op=3'bz;
						end
			
			endcase
	end
	*/
endmodule


