`timescale 1ns / 1ps
// Final corrected version with output gating

module tx_frontend (
    input                 clk,
    input                 rst_n,
    input                 load_en,
    input      [15:0]     p_in,

    output                data_valid,
    output signed [7:0]   dout_i,
    output signed [7:0]   dout_q
);

    // Internal wires
    wire [1:0] serial_data_wire;
    wire signed [7:0] mapper_i_out; // Wire to catch the mapper's I output
    wire signed [7:0] mapper_q_out; // Wire to catch the mapper's Q output

    // Instantiate the serializer
    serializer serializer_inst (
        .clk(clk),
        .rst_n(rst_n),
        .load_en(load_en),
        .p_in(p_in),
        .s_out(serial_data_wire),
        .data_valid(data_valid)
    );

    // Instantiate the QPSK mapper, connecting it to our internal wires
    qpsk_mapper qpsk_mapper_inst (
        .din(serial_data_wire),
        .dout_i(mapper_i_out),
        .dout_q(mapper_q_out)
    );

    // THE FIX:
    // Use a conditional assignment to drive the final outputs.
    // If data_valid is true, pass the mapper's output.
    // Otherwise, drive the output to zero.
    assign dout_i = data_valid ? mapper_i_out : 8'd0;
    assign dout_q = data_valid ? mapper_q_out : 8'd0;

endmodule
