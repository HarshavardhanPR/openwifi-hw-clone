`timescale 1ns / 1ps
// Corrected Testbench for the combined serializer and mapper

module tb_tx_frontend;
    // Testbench signals
    reg clk;
    reg rst_n;
    reg load_en;
    reg [15:0] p_in;
    wire data_valid;
    wire signed [7:0] dout_i;
    wire signed [7:0] dout_q;

    // Instantiate the new top-level module with explicit connections
    tx_frontend uut (
        .clk(clk),
        .rst_n(rst_n),
        .load_en(load_en),
        .p_in(p_in),
        .data_valid(data_valid),
        .dout_i(dout_i),
        .dout_q(dout_q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock
    end

    // Test stimulus
    initial begin
        $display("Time\t p_in\t\t valid\t I_out\t Q_out");
        $monitor("%0t\t %h\t %b\t %d\t %d", $time, p_in, data_valid, dout_i, dout_q);

        load_en = 1'b0;
        p_in    = 16'h0;
        rst_n   = 1'b0;
        repeat(2) @(posedge clk);
        rst_n   = 1'b1;
        @(posedge clk);

        // Load first word
        load_en = 1'b1;
        p_in    = 16'hABCD;
        @(posedge clk);
        load_en = 1'b0;
        repeat(8) @(posedge clk);

        $display("--> Test finished.");
        $finish;
    end
endmodule