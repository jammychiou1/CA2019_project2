module Control(Instruction_in, Flush_in, RegWrite_out, MemWrite_out, ALUSrc_out, Branch_out, MemRead_out, ALUOp_out);
input [31:0] Instruction_in;
input Flush_in;
output RegWrite_out;
output MemWrite_out;
output ALUSrc_out;
output Branch_out;
output MemRead_out;
output [2:0] ALUOp_out;
assign RegWrite_out = Instruction_in[5:4] != 2 & Instruction_in != 0;
assign MemWrite_out = Instruction_in[6:4] == 2;
assign ALUSrc_out = Instruction_in[5:4] != 3 & !Instruction_in[6];
assign Branch_out = Instruction_in[6];
assign MemRead_out = Instruction_in[6:4] == 0 & Instruction_in != 0;
assign ALUOp_out = Instruction_in[5:4] != 3 ? 2:
                   Instruction_in[12] ? 1 :
                   Instruction_in[14] ? 0 :
                   Instruction_in[25] ? 4 :
                   Instruction_in[30] ? 3 : 2;
endmodule
