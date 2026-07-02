module top (
    input wire clk,   // system clock
    input wire rst    // synchronous reset for PC
);

    wire [7:0]  pc;                
    wire [22:0] instr;             

    wire [2:0]  aluop;
    wire [2:0]  readreg1, readreg2, writereg;
    wire        write_enable;
    wire [7:0]  immediate;
    wire        sel_immidiate;
    wire        sel_comp;

    wire [7:0]  out1, out2;

    wire [7:0]  twos_comp_out;

    wire [7:0]  operand1, operand2;

    wire [7:0]  alu_result;

    program_counter_8bit pc_inst (
        .clk    (clk),
        .rst    (rst),
        .pc_out (pc)
    );

    inst_mem inst_mem_inst (
        .addr   (pc),
        .instr  (instr)
    );

    control_unit cu_inst (
        .instr          (instr),
        .aluop          (aluop),
        .readreg1       (readreg1),
        .readreg2       (readreg2),
        .writereg       (writereg),
        .write_enable   (write_enable),
        .immediate      (immediate),
        .sel_immidiate  (sel_immidiate),
        .sel_comp       (sel_comp)
    );

    reg_file rf_inst (
        .clk        (clk),
        .write_en   (write_enable),
        .read_reg1  (readreg1),
        .read_reg2  (readreg2),
        .write_reg  (writereg),
        .write_data (alu_result),  
        .out1       (out1),
        .out2       (out2),
        .debug_reg0(),   
        .debug_reg1(),   
        .debug_reg2(),   
        .debug_reg3(),   
        .debug_reg4(),   
        .debug_reg5(),   
        .debug_reg6(),   
        .debug_reg7()   

    );

    twos_complement_8bit_alt comp_inst (
        .data_in    (out1),
        .data_out   (twos_comp_out)
    );

    assign operand1 = sel_immidiate ? immediate : (sel_comp ? twos_comp_out : out1);

    assign operand2 = out2;

    ALU alu_inst (
        .operand1   (operand1),
        .operand2   (operand2),
        .aluOp      (aluop),
        .aluResult  (alu_result)
    );

endmodule