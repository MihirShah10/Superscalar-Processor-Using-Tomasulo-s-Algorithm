
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module ADD_Reservation_Station(
//release_pointer,
/*dummy_out,
dummy_out1,
dummy_bit1,
dummy_out2,
dummy_bit2,
dummy_out3,
dummy_bit3,
dummy_out4,
dummy_bit4,*/
ADD_Tag_ip, 
AR_Status, 
ADD_Operand1, 
ADD_Operand2, 
Operand1, 
Operand2, 
Operand1_Tag, 
Operand2_Tag, 
Operand1_Vbit, 
Operand2_Vbit, 
ADD_Status, 
clk );

output reg [2:0] ADD_Tag_ip;
output reg AR_Status = 1'b0;
output reg[7:0] ADD_Operand1;
output reg[7:0] ADD_Operand2;
/*
output reg [23:0] dummy_out;
output reg [7:0] dummy_out1;
output reg [7:0] dummy_out2;
output reg [7:0] dummy_out3;
output reg [7:0] dummy_out4;
output reg dummy_bit1;
output reg dummy_bit2;
output reg dummy_bit3;
output reg dummy_bit4;
*/

input wire [7:0] Operand1;                      
input wire [7:0] Operand2;
input wire [2:0] Operand1_Tag;
input wire [2:0] Operand2_Tag;
input wire Operand1_Vbit;
input wire Operand2_Vbit;
input wire ADD_Status;
input wire clk;

integer count=0;
reg [1:0] release_pointer = 2'b0;

integer i;
//integer select1=0;
reg [23:0] ADD_Res_Station [3:0];

initial 
begin
//	abc = 24'b0;
	ADD_Res_Station[0][23:0] = 24'b011111111111011111111111;
	ADD_Res_Station[1][23:0] = 24'b011111111111011111111111;
	ADD_Res_Station[2][23:0] = 24'b011111111111011111111111;
	ADD_Res_Station[3][23:0] = 24'b011111111111011111111111;

end

always @(clk)																					// To check which row of Res Station is free
begin
	if(ADD_Res_Station[0][23:0] == 24'b011111111111011111111111)
	begin
		AR_Status = 1'b0;
		count = 1;
	end
	
	else if(ADD_Res_Station[1][23:0] == 24'b011111111111011111111111)
			begin
				AR_Status = 1'b0;
				count = 2;
			end
			
			else if(ADD_Res_Station[2][23:0] == 24'b011111111111011111111111)
					begin
						AR_Status = 1'b0;
						count = 3;
					end
					
					else if(ADD_Res_Station[3][23:0] == 24'b011111111111011111111111)
							begin
								AR_Status = 1'b0;
								count = 4;
							end
							
							else AR_Status = 1'b1;
			
end

/*

always @(clk)
begin
	dummy_out1[7:0] = ADD_Res_Station[0][7:0];
	dummy_out2[7:0] = ADD_Res_Station[1][7:0];
	dummy_out3[7:0] = ADD_Res_Station[2][7:0];
	dummy_out4[7:0] = ADD_Res_Station[3][7:0];
	dummy_bit1 = ADD_Res_Station[0][11];
	dummy_bit2 = ADD_Res_Station[0][23];
	dummy_bit3 = ADD_Res_Station[2][11];
	dummy_bit4 = ADD_Res_Station[3][11];
end
*/

always @(clk)																							// To fill up data in the reservation station
begin
	if((count == 1) && (Operand1 != `sanity && Operand2 != `sanity))
	begin
		ADD_Res_Station[0][23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
		//dummy_out[23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};		
	end
	
	else if((count == 2) && (Operand1 != `sanity && Operand2 != `sanity))
			begin
				ADD_Res_Station[1][23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
				//dummy_out[23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
			end
			
			else if ((count == 3) && (Operand1 != `sanity && Operand2 != `sanity))
					begin
						ADD_Res_Station[2][23:0]={Operand1_Vbit,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
						//dummy_out[23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
					end
					
					else if ((count == 4) && (Operand1 != `sanity && Operand2 != `sanity))
					begin
						ADD_Res_Station[3][23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
						//dummy_out[23:0]={Operand1_Vbit,Operand1_Tag,Operand1,Operand2_Vbit,Operand2_Tag,Operand2};
					end					
end




always @(clk)																						// To issue operands to adder functional unit
begin
	if(ADD_Status==1'b0)
	begin
		if (ADD_Res_Station[0][23] == 1'b1 && ADD_Res_Station[0][11] == 1'b1 && release_pointer == 2'b0)
		begin
			ADD_Operand1=ADD_Res_Station[0][19:12];
			ADD_Operand2=ADD_Res_Station[0][7:0];
			//ADD_Operand1 = 8'b10101010;
			//ADD_Operand2 = 8'b01010101;
			ADD_Tag_ip=`a;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b10101010;
		end
		
		else if (ADD_Res_Station[1][23] == 1'b1 && ADD_Res_Station[1][11] == 1'b1 && release_pointer == 2'b01)
		begin
			ADD_Operand1=ADD_Res_Station[1][19:12];
			ADD_Operand2=ADD_Res_Station[1][7:0];
			ADD_Tag_ip=`b;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b10100000;
		end
		
		else if (/*ADD_Res_Station[2][23] == 1'b1 && ADD_Res_Station[2][11] == 1'b1 &&*/ release_pointer == 2'b10)
		begin
			ADD_Operand1=ADD_Res_Station[2][19:12];
			ADD_Operand2=ADD_Res_Station[2][7:0];
			ADD_Tag_ip=`c;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b11111000;
		end
				
		else if (ADD_Res_Station[3][23] == 1'b1 && ADD_Res_Station[3][11] == 1'b1 && release_pointer == 2'b11)
		begin
			ADD_Operand1=ADD_Res_Station[3][19:12];
			ADD_Operand2=ADD_Res_Station[3][7:0];
			ADD_Tag_ip=`d;
			release_pointer = 2'b0;
			//dummy_out1=8'b10111111;
		end
		
		else 
		begin
			ADD_Operand1=`sanity;
			ADD_Operand2=`sanity;
		end
	end	
	else if (ADD_Status==1'b1)
			begin
				ADD_Operand1=`sanity;
				ADD_Operand2=`sanity;
			end	
end

endmodule
