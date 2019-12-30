module Imm_Gen(Instruction_in, Immediate_out);
input [31:0] Instruction_in;
output [31:0] Immediate_out;

assign Immediate_out= {{20{Instruction_in[31]}} ,Instruction_in[31:25], (Instruction_in[5]==0) ? Instruction_in[24:20] : Instruction_in[11:7]};

endmodule
