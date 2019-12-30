module Shift_Left_1(Immediate_in, JumpOffset_out);
input [31:0] Immediate_in;
output [31:0] JumpOffset_out;

assign JumpOffset_out={Immediate_in[31:12],Immediate_in[0],Immediate_in[10:1],1'b0};

endmodule
