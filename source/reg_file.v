module reg_file (
    input  wire        clk,
    input  wire        write_en,
    input  wire [2:0]  read_reg1,
    input  wire [2:0]  read_reg2,
    input  wire [2:0]  write_reg,
    input  wire [7:0]  write_data,
    output wire [7:0]  out1,
    output wire [7:0]  out2,
    output wire [7:0]  debug_reg0,
    output wire [7:0]  debug_reg1,
    output wire [7:0]  debug_reg2,
    output wire [7:0]  debug_reg3,
    output wire [7:0]  debug_reg4,
    output wire [7:0]  debug_reg5,
    output wire [7:0]  debug_reg6,
    output wire [7:0]  debug_reg7
);
    assign debug_reg0 = regs[0];
    assign debug_reg1 = regs[1];
    assign debug_reg2 = regs[2];
    assign debug_reg3 = regs[3];
    assign debug_reg4 = regs[4];
    assign debug_reg5 = regs[5];
    assign debug_reg6 = regs[6];
    assign debug_reg7 = regs[7];

    reg [7:0] regs [0:7];
    initial begin
        regs[0] = 8'h03;
        regs[1] = 8'h04;
        regs[2] = 8'h00; 
        regs[3] = 8'h00;
        regs[4] = 8'h00; 
        regs[5] = 8'h00;
        regs[6] = 8'h00;
        regs[7] = 8'h00;
    end

    always @(posedge clk) begin
        if (write_en)
            regs[write_reg] <= write_data;
    end

    assign out1 = regs[read_reg1];
    assign out2 = regs[read_reg2];
endmodule