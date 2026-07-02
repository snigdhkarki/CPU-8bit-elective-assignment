module control_unit (
    input  wire [22:0] instr,
    output wire [2:0]  aluop,
    output wire [2:0]  readreg1,
    output wire [2:0]  readreg2,
    output wire [2:0]  writereg,
    output wire        write_enable,
    output wire [7:0]  immediate,
    output wire        sel_immidiate,
    output wire        sel_comp    
);
    assign immediate     = instr[22:15];
    assign aluop         = instr[14:12];
    assign readreg1      = instr[11:9];
    assign readreg2      = instr[8:6];
    assign writereg      = instr[5:3];
    assign write_enable  = instr[2];    
    assign sel_immidiate = instr[1]; 
    assign sel_comp      = instr[0]; 
endmodule