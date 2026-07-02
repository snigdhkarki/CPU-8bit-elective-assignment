module ALU (
    input  wire [7:0] operand1,
    input  wire [7:0] operand2,
    input  wire [2:0] aluOp,
    output wire [7:0] aluResult
);

    assign aluResult = (aluOp == 3'b000) ? (operand1 + operand2) : // ADD
                       (aluOp == 3'b001) ? (operand1 - operand2) : // SUB
                       (aluOp == 3'b010) ? (operand1 & operand2) : // AND
                       (aluOp == 3'b011) ? (operand1 | operand2) : // OR
                       (aluOp == 3'b100) ? (operand1 ^ operand2) : // XOR
                       (aluOp == 3'b101) ? (~operand1)           : // NOT
                       (aluOp == 3'b110) ? (operand1 << 1)       : // Logical Shift Left
                                           (operand1 >> 1);        // Logical Shift Right

endmodule