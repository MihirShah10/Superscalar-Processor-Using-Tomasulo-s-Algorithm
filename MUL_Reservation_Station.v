/*
`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"


module MUL_Reservation_Station(dummy_out1,dummy_out, MUL_Tag_ip, E1, E2, E3, E4, MR_Status, MUL_Operand3, MUL_Operand4,select, Operand3, Operand4, Operand3_Tag, Operand4_Tag, Operand3_Vbit, Operand4_Vbit, MUL_Status, clk );

output reg [2:0] MUL_Tag_ip;
output reg E1, E2, E3, E4;
output reg MR_Status = 1'b0;
output reg[7:0] MUL_Operand3;
output reg[7:0] MUL_Operand4;
output reg[2:0]select=3'b0;

output reg[23:0] dummy_out;
output reg[23:0] dummy_out1;

input wire [7:0] Operand3;                      
input wire [7:0] Operand4;
input wire [2:0] Operand3_Tag;
input wire [2:0] Operand4_Tag;
input wire Operand3_Vbit;
input wire Operand4_Vbit;
input wire MUL_Status;
input wire clk;

integer count=0;

integer i;
integer select1=0;
reg [23:0] MUL_Res_Station [3:0];

initial 
begin
//	abc = 24'b0;
	MUL_Res_Station[0][23:0] = 24'b111111111111111111111111;
	MUL_Res_Station[1][23:0] = 24'b111111111111111111111111;
	MUL_Res_Station[2][23:0] = 24'b111111111111111111111111;
	MUL_Res_Station[3][23:0] = 24'b111111111111111111111111;

end


always @(posedge clk)
begin
	if(MUL_Res_Station[0][23:0] == 24'b111111111111111111111111)
	begin
		MR_Status = 1'b0;
		count = 1;
	end
	
	else if(MUL_Res_Station[1][23:0] == 24'b111111111111111111111111)
			begin
				MR_Status = 1'b0;
				count = 2;
			end
			
			else if(MUL_Res_Station[2][23:0] == 24'b111111111111111111111111)
					begin
						MR_Status = 1'b0;
						count = 3;
					end
					
					else if(MUL_Res_Station[3][23:0] == 24'b111111111111111111111111)
							begin
								MR_Status = 1'b0;
								count = 4;
							end
							
							else MR_Status = 1'b1;
			
end


always @(posedge clk)
begin
	if(MUL_Res_Station[0][23:0] == 24'b111111111111111111111111)
	begin
		MUL_Res_Station[0][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
		dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
	end
	
	else if(MUL_Res_Station[1][23:0] == 24'b111111111111111111111111)
			begin
				MUL_Res_Station[1][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
				dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
			end
			
			else if (MUL_Res_Station[2][23:0] == 24'b111111111111111111111111)
					begin
						MUL_Res_Station[2][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end
					
					else if (MUL_Res_Station[3][23:0] == 24'b111111111111111111111111)
					begin
						MUL_Res_Station[3][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end
					
end

always @(negedge clk)
begin
	if(MUL_Res_Station[0][23:0] == 24'b111111111111111111111111)
	begin
		MUL_Res_Station[0][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
		dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
	end
	
	else if(MUL_Res_Station[1][23:0] == 24'b111111111111111111111111)
			begin
				MUL_Res_Station[1][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
				dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
			end
			
			else if (MUL_Res_Station[2][23:0] == 24'b111111111111111111111111)
					begin
						MUL_Res_Station[2][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end
					
					else if (MUL_Res_Station[3][23:0] == 24'b111111111111111111111111)
					begin
						MUL_Res_Station[3][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end
end


always @(posedge clk)
begin
	if(MUL_Status==1'b0)
	begin
		if (MUL_Res_Station[0][23] == 1'b1 && MUL_Res_Station[0][11] == 1'b1)
		begin
			MUL_Operand3=MUL_Res_Station[0][19:12];
			MUL_Operand4=MUL_Res_Station[0][7:0];
			MUL_Tag_ip=`w;
			//dummy_out1=8'b10101010;
		end
		
		else if (MUL_Res_Station[1][23] == 1'b1 && MUL_Res_Station[1][11] == 1'b1)
		begin
			MUL_Operand3=MUL_Res_Station[1][19:12];
			MUL_Operand4=MUL_Res_Station[1][7:0];
			MUL_Tag_ip=`x;
			//dummy_out1=8'b10100000;
		end
		
		else if (MUL_Res_Station[2][23] == 1'b1 && MUL_Res_Station[2][11] == 1'b1)
		begin
			MUL_Operand3=MUL_Res_Station[2][19:12];
			MUL_Operand4=MUL_Res_Station[2][7:0];
			MUL_Tag_ip=`y;
			//dummy_out1=8'b11111000;
		end
				
		else if (MUL_Res_Station[3][23] == 1'b1 && MUL_Res_Station[3][11] == 1'b1)
		begin
			MUL_Operand3=MUL_Res_Station[3][19:12];
			MUL_Operand4=MUL_Res_Station[3][7:0];
			MUL_Tag_ip=`z;
			//dummy_out1=8'b10111111;
		end
	end	
	else if (MUL_Status==1'b1)
			begin
				MUL_Operand3=8'bz;
				MUL_Operand4=8'bz;
			end	
end

always @(negedge clk)
begin
	if(MUL_Tag_ip == `w) 
	begin
		MUL_Res_Station[0][23] = 1'b0;
		MUL_Res_Station[0][11] = 1'b0;
	end
	
	else if(MUL_Tag_ip == `x)
			begin
				MUL_Res_Station[1][23] = 1'b0;
				MUL_Res_Station[1][11] = 1'b0;
			end

			else if(MUL_Tag_ip == `y)
			begin
				MUL_Res_Station[2][23] = 1'b0;
				MUL_Res_Station[2][11] = 1'b0;
			end
			
					else if(MUL_Tag_ip == `z)
							begin
								MUL_Res_Station[3][23] = 1'b0;
								MUL_Res_Station[3][11] = 1'b0;
							end			
end
endmodule
*/

`include "/home/eng/s/spp150130/spp150130/Tomasulo_Implementation/Definition_File.v"

module MUL_Reservation_Station(
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
MUL_Tag_ip, 
MR_Status, 
MUL_Operand3, 
MUL_Operand4, 
Operand3, 
Operand4, 
Operand3_Tag, 
Operand4_Tag, 
Operand3_Vbit, 
Operand4_Vbit, 
MUL_Status, 
clk );

output reg [2:0] MUL_Tag_ip;
output reg MR_Status = 1'b0;
output reg[7:0] MUL_Operand3;
output reg[7:0] MUL_Operand4;
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

input wire [7:0] Operand3;                      
input wire [7:0] Operand4;
input wire [2:0] Operand3_Tag;
input wire [2:0] Operand4_Tag;
input wire Operand3_Vbit;
input wire Operand4_Vbit;
input wire MUL_Status;
input wire clk;

integer count=0;
reg [1:0] release_pointer = 2'b0;

integer i;
//integer select1=0;
reg [23:0] MUL_Res_Station [3:0];

initial 
begin
//	abc = 24'b0;
	MUL_Res_Station[0][23:0] = 24'b011111111111011111111111;
	MUL_Res_Station[1][23:0] = 24'b011111111111011111111111;
	MUL_Res_Station[2][23:0] = 24'b011111111111011111111111;
	MUL_Res_Station[3][23:0] = 24'b011111111111011111111111;

end

always @(clk)																					// To check which row of Res Station is free
begin
	if(MUL_Res_Station[0][23:0] == 24'b011111111111011111111111)
	begin
		MR_Status = 1'b0;
		count = 1;
	end
	
	else if(MUL_Res_Station[1][23:0] == 24'b011111111111011111111111)
			begin
				MR_Status = 1'b0;
				count = 2;
			end
			
			else if(MUL_Res_Station[2][23:0] == 24'b011111111111011111111111)
					begin
						MR_Status = 1'b0;
						count = 3;
					end
					
					else if(MUL_Res_Station[3][23:0] == 24'b011111111111011111111111)
							begin
								MR_Status = 1'b0;
								count = 4;
							end
							
							else MR_Status = 1'b1;
			
end

/*

always @(clk)
begin
	dummy_out1[7:0] = MUL_Res_Station[0][7:0];
	dummy_out2[7:0] = MUL_Res_Station[1][7:0];
	dummy_out3[7:0] = MUL_Res_Station[2][7:0];
	dummy_out4[7:0] = MUL_Res_Station[3][7:0];
	dummy_bit1 = MUL_Res_Station[0][11];
	dummy_bit2 = MUL_Res_Station[0][23];
	dummy_bit3 = MUL_Res_Station[2][11];
	dummy_bit4 = MUL_Res_Station[3][11];
end
*/

always @(clk)																							// To fill up data in the reservation station
begin
	if((count == 1) && (Operand3 != `sanity && Operand4 != `sanity))
	begin
		MUL_Res_Station[0][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
		//dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};		
	end
	
	else if((count == 2) && (Operand3 != `sanity && Operand4 != `sanity))
			begin
				MUL_Res_Station[1][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
				//dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
			end
			
			else if ((count == 3) && (Operand3 != `sanity && Operand4 != `sanity))
					begin
						MUL_Res_Station[2][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						//dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end
					
					else if ((count == 4) && (Operand3 != `sanity && Operand4 != `sanity))
					begin
						MUL_Res_Station[3][23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
						//dummy_out[23:0]={Operand3_Vbit,Operand3_Tag,Operand3,Operand4_Vbit,Operand4_Tag,Operand4};
					end					
end




always @(clk)																						// To issue operands to MULer functional unit
begin
	if(MUL_Status==1'b0)
	begin
		if (MUL_Res_Station[0][23] == 1'b1 && MUL_Res_Station[0][11] == 1'b1 && release_pointer == 2'b0)
		begin
			MUL_Operand3=MUL_Res_Station[0][19:12];
			MUL_Operand4=MUL_Res_Station[0][7:0];
			//MUL_Operand3 = 8'b10101010;
			//MUL_Operand4 = 8'b01010101;
			MUL_Tag_ip=`w;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b10101010;
		end
		
		else if (MUL_Res_Station[1][23] == 1'b1 && MUL_Res_Station[1][11] == 1'b1 && release_pointer == 2'b01)
		begin
			MUL_Operand3=MUL_Res_Station[1][19:12];
			MUL_Operand4=MUL_Res_Station[1][7:0];
			MUL_Tag_ip=`x;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b10100000;
		end
		
		else if (MUL_Res_Station[2][23] == 1'b1 && MUL_Res_Station[2][11] == 1'b1 && release_pointer == 2'b10)
		begin
			MUL_Operand3=MUL_Res_Station[2][19:12];
			MUL_Operand4=MUL_Res_Station[2][7:0];
			MUL_Tag_ip=`y;
			release_pointer = release_pointer + 2'b01;
			//dummy_out1=8'b11111000;
		end
				
		else if (MUL_Res_Station[3][23] == 1'b1 && MUL_Res_Station[3][11] == 1'b1 && release_pointer == 2'b11)
		begin
			MUL_Operand3=MUL_Res_Station[3][19:12];
			MUL_Operand4=MUL_Res_Station[3][7:0];
			MUL_Tag_ip=`z;
			release_pointer = 2'b0;
			//dummy_out1=8'b10111111;
		end
		
		else 
		begin
			MUL_Operand3=`sanity;
			MUL_Operand4=`sanity;
		end
	end	
	else if (MUL_Status==1'b1)
			begin
				MUL_Operand3=`sanity;
				MUL_Operand4=`sanity;
			end	
end

endmodule

