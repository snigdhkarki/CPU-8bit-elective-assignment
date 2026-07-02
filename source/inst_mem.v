module inst_mem (
    input  wire [7:0]  addr,
    output wire [22:0] instr
);
    reg [22:0] mem [0:255];
    initial begin
        mem[0] = {8'b00000000, 3'b000, 3'b000, 3'b001, 3'b010, 1'b1, 1'b0, 1'b0}; //r2 = r0 + r1
        mem[1] = {8'b10101010, 3'b010, 3'b000, 3'b010, 3'b011, 1'b1, 1'b1, 1'b0}; //r3 = r2 & 10101010
        mem[2] = {8'b00000000, 3'b000, 3'b000, 3'b001, 3'b100, 1'b1, 1'b0, 1'b1}; //r4 = r1 - r0
        mem[3] = {8'b00000000, 3'b100, 3'b000, 3'b001, 3'b101, 1'b1, 1'b0, 1'b0}; //r5 = r0 ^ r1
        mem[5] = {8'b00000000, 3'b000, 3'b000, 3'b000, 3'b000, 1'b0, 1'b0, 1'b0}; //end
    end
    assign instr = mem[addr];
endmodule