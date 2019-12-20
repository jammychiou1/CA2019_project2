`define CYCLE_TIME 50
module DMTest();
reg Clk;
reg Reset;
wire ack_o;
wire [255:0] data_o;
integer counter;
Data_Memory Data_Memory
(
    .clk_i    (Clk),
    .rst_i    (Reset),
    .addr_i   (32'b0),
    .data_i   (256'b0),
    .enable_i (1'b1),
    .write_i  (1'b0),
    .ack_o    (ack_o),
    .data_o   (data_o)
);
always #(`CYCLE_TIME/2) Clk = ~Clk; 
initial begin
    $dumpfile("DMTest.dump");
    $dumpvars(0, DMTest);
    counter=0;

    Data_Memory.memory[0] = 256'h5;
    Clk = 0;
    Reset = 0;
    
    #(`CYCLE_TIME/4) 
    Reset = 1;
end
always@(posedge Clk) begin
    if(counter > 30) begin    // stop 
        $finish;
    end
    counter = counter + 1;
end
endmodule
