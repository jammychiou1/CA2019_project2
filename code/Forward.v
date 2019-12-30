module Forward (RDAddr_WB, RDAddr_MEM, RegWrite_WB, RegWrite_MEM, RS1Addr_EX, RS2Addr_EX, Forward1_EX, Forward2_EX);
input [4:0] RDAddr_WB;
input       RegWrite_WB;
input [4:0] RDAddr_MEM;
input       RegWrite_MEM;
input [4:0] RS1Addr_EX;
input [4:0] RS2Addr_EX;
output [1:0] Forward1_EX;
output [1:0] Forward2_EX;

assign Forward1_EX = (RegWrite_MEM == 1 && RDAddr_MEM != 0 && RDAddr_MEM == RS1Addr_EX ) ? 2'b10 :
                   (RegWrite_WB ==1 && RDAddr_WB !=0 && RDAddr_WB == RS1Addr_EX ) ? 2'b01 :
                   	2'b00;
assign Forward2_EX = (RegWrite_MEM == 1 && RDAddr_MEM != 0 && RDAddr_MEM == RS2Addr_EX ) ? 2'b10 :
                   (RegWrite_WB ==1 && RDAddr_WB !=0 && RDAddr_WB == RS2Addr_EX ) ? 2'b01 :
                   	2'b00;
endmodule
