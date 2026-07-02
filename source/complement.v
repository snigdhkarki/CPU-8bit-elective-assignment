module twos_complement_8bit_alt (
    input  wire [7:0] data_in,
    output wire [7:0] data_out
);

    assign data_out = -data_in;

endmodule