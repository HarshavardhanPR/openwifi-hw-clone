`timescale 1ns / 1ps
// Corrected testbench for the butterfly unit

module tb_butterfly_unit;
    // Testbench Signals
    reg clk;
    reg rst_n;
    reg data_valid_in;
    reg signed [7:0] a_i, a_q, b_i, b_q, w_i, w_q;

    // Wires to connect to the unit's outputs
    wire signed [15:0] x_i, x_q, y_i, y_q;
    wire               data_valid_out;

    // Instantiate the butterfly unit with explicit connections
    butterfly_unit uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_valid_in(data_valid_in),
        .a_i(a_i), .a_q(a_q),
        .b_i(b_i), .b_q(b_q),
        .w_i(w_i), .w_q(w_q),
        .x_i(x_i), .x_q(x_q),
        .y_i(y_i), .y_q(y_q),
        .data_valid_out(data_valid_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\t valid_in | A(i,q) B(i,q) W(i,q) | valid_out | X(i,q) Y(i,q)");
        $monitor("%0t\t %b        | (%d,%d) (%d,%d) (%d,%d) | %b         | (%d,%d) (%d,%d)",
                 $time, data_valid_in, a_i, a_q, b_i, b_q, w_i, w_q, data_valid_out, x_i, x_q, y_i, y_q);

        // Initialize and Reset
        data_valid_in = 0;
        a_i=0; a_q=0; b_i=0; b_q=0; w_i=0; w_q=0;
        rst_n = 1'b0;
        repeat(2) @(posedge clk);
        rst_n = 1'b1;
        @(posedge clk);

        // Provide test data
        data_valid_in = 1'b1;
        a_i = 10; a_q = 20;
        b_i = 30; b_q = 40;
        w_i = 50; w_q = 0;
        @(posedge clk);
        data_valid_in = 1'b0;

        // Wait for the pipeline to finish
        repeat(5) @(posedge clk);

        $display("--> Test finished.");
        $finish;
    end
endmodule