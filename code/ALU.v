module ALU(Data1_in, Data2_in, ALUOp_in,Data_out);

input [31:0] Data1_in;
input [31:0] Data2_in;
input [2:0] ALUOp_in;
output [31:0] Data_out;

assign Data_out = (ALUOp_in == 4) ? Data1_in * Data2_in:
	            (ALUOp_in == 0) ? Data1_in | Data2_in:
	            (ALUOp_in == 1) ? Data1_in & Data2_in:
	            (ALUOp_in == 2) ? Data1_in + Data2_in:
	            Data1_in - Data2_in;
endmodule
