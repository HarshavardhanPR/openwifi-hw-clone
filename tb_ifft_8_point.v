`timescale 1ns / 1ps
// Corrected Testbench for the 8-Point IFFT Processor

module tb_ifft_8_point;
    reg clk;
    reg rst_n;
    reg start_ifft;
    reg signed [7:0] in0_i, in0_q, in1_i, in1_q, in2_i, in2_q, in3_i, in3_q;
    reg signed [7:0] in4_i, in4_q, in5_i, in5_q, in6_i, in6_q, in7_i, in7_q;

    wire signed [15:0] out0_i, out0_q, out1_i, out1_q, out2_i, out2_q, out3_i, out3_q;
    wire signed [15:0] out4_i, out4_q, out5_i, out5_q, out6_i, out6_q, out7_i, out7_q;
    wire data_ready;

    // Correct instantiation with explicit port connections
    ifft_8_point uut (
        .clk(clk), .rst_n(rst_n), .start_ifft(start_ifft),
        .in0_i(in0_i), .in0_q(in0_q), .in1_i(in1_i), .in1_q(in1_q),
        .in2_i(in2_i), .in2_q(in2_q), .in3_i(in3_i), .in3_q(in3_q),
        .in4_i(in4_i), .in4_q(in4_q), .in5_i(in5_i), .in5_q(in5_q),
        .in6_i(in6_i), .in6_q(in6_q), .in7_i(in7_i), .in7_q(in7_q),
        .out0_i(out0_i), .out0_q(out0_q), .out1_i(out1_i), .out1_q(out1_q),
        .out2_i(out2_i), .out2_q(out2_q), .out3_i(out3_i), .out3_q(out3_q),
        .out4_i(out4_i), .out4_q(out4_q), .out5_i(out5_i), .out5_q(out5_q),
        .out6_i(out6_i), .out6_q(out6_q), .out7_i(out7_i), .out7_q(out7_q),
        .data_ready(data_ready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\t Start | Ready | Out0(i,q)");
        $monitor("%0t\t %b     | %b     | (%d, %d)", $time, start_ifft, data_ready, out0_i, out0_q);

        // Initialize and Reset
        start_ifft = 0;
        {in0_i, in0_q, in1_i, in1_q, in2_i, in2_q, in3_i, in3_q} = 0;
        {in4_i, in4_q, in5_i, in5_q, in6_i, in6_q, in7_i, in7_q} = 0;
        rst_n = 1'b0;
        repeat(2) @(posedge clk);
        rst_n = 1'b1;
        @(posedge clk);

        // Provide impulse input (in0 = 127, others = 0)
        start_ifft = 1'b1;
        in0_i = 127;
        @(posedge clk);
        start_ifft = 1'b0;

        // Wait for data_ready
        wait(data_ready);
        @(posedge clk);

        $display("--> IFFT calculation finished. All outputs should be the same.");
        $display("    out0: (%d, %d)", out0_i, out0_q);
        $display("    out1: (%d, %d)", out1_i, out1_q);
        $display("    out2: (%d, %d)", out2_i, out2_q);
        $display("    out3: (%d, %d)", out3_i, out3_q);
        $display("    out4: (%d, %d)", out4_i, out4_q);
        $display("    out5: (%d, %d)", out5_i, out5_q);
        $display("    out6: (%d, %d)", out6_i, out6_q);
        $display("    out7: (%d, %d)", out7_i, out7_q); // Corrected typo here
        
        $display("--> Test finished.");
        $finish;
    end
endmodule
