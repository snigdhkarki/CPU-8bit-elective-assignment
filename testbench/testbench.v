`timescale 1ns / 1ps

module cpu_tb;

    reg clk;
    reg rst;

    top top_unit (
        .clk(clk),
        .rst(rst)
    ); 

    always #5 clk = ~clk;

    initial begin

        $dumpfile("test.vcd");
        $dumpvars(0, top_unit);

        clk = 0;
        rst = 1;
        #10 rst = 0;      // release reset after the first clock edge

        #40 $finish; 
        

    end

endmodule