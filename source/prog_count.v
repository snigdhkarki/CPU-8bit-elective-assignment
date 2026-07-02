module program_counter_8bit (
    input  wire       clk,   
    input  wire       rst,   
    output reg  [7:0] pc_out 
);

    always @(posedge clk) begin
        if (rst) begin
            pc_out <= 8'b0; 
        end else begin
            pc_out <= pc_out + 1'b1;
        end
    end

endmodule