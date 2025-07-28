`timescale 1ns / 1ps
// An 8-point, pipelined, Radix-2 DIT IFFT Processor.

module ifft_8_point (
    input clk,
    input rst_n,
    input start_ifft, // Signal to start the IFFT calculation
  
    // 8 complex number inputs
    input signed [7:0] in0_i, in0_q,
    input signed [7:0] in1_i, in1_q,
    input signed [7:0] in2_i, in2_q,
    input signed [7:0] in3_i, in3_q,
    input signed [7:0] in4_i, in4_q,
    input signed [7:0] in5_i, in5_q,
    input signed [7:0] in6_i, in6_q,
    input signed [7:0] in7_i, in7_q,

    // 8 complex number outputs (bit-reversed order)
    output reg signed [15:0] out0_i, out0_q,
    output reg signed [15:0] out1_i, out1_q,
    output reg signed [15:0] out2_i, out2_q,
    output reg signed [15:0] out3_i, out3_q,
    output reg signed [15:0] out4_i, out4_q,
    output reg signed [15:0] out5_i, out5_q,
    output reg signed [15:0] out6_i, out6_q,
    output reg signed [15:0] out7_i, out7_q,

    output reg data_ready // High for one cycle when output is valid
);

    // --- Twiddle Factors (Constants) ---
    // Scaled by 127 to be used with 8-bit signed numbers
    localparam W0_I = 127, W0_Q = 0;   // W_8^0 = 1
    localparam W1_I = 90,  W1_Q = -90;  // W_8^1 = 0.707 - 0.707j
    localparam W2_I = 0,   W2_Q = -127; // W_8^2 = -j
    localparam W3_I = -90, W3_Q = -90;  // W_8^3 = -0.707 - 0.707j

    // --- Internal Wires and Registers ---
    wire s1_valid;
    wire signed [15:0] s1_0i, s1_0q, s1_1i, s1_1q, s1_2i, s1_2q, s1_3i, s1_3q;
    wire signed [15:0] s1_4i, s1_4q, s1_5i, s1_5q, s1_6i, s1_6q, s1_7i, s1_7q;

    reg s1_reg_valid;
    reg signed [15:0] s1_reg_0i, s1_reg_0q, s1_reg_1i, s1_reg_1q, s1_reg_2i, s1_reg_2q, s1_reg_3i, s1_reg_3q;
    reg signed [15:0] s1_reg_4i, s1_reg_4q, s1_reg_5i, s1_reg_5q, s1_reg_6i, s1_reg_6q, s1_reg_7i, s1_reg_7q;

    wire s2_valid;
    wire signed [15:0] s2_0i, s2_0q, s2_1i, s2_1q, s2_2i, s2_2q, s2_3i, s2_3q;
    wire signed [15:0] s2_4i, s2_4q, s2_5i, s2_5q, s2_6i, s2_6q, s2_7i, s2_7q;

    reg s2_reg_valid;
    reg signed [15:0] s2_reg_0i, s2_reg_0q, s2_reg_1i, s2_reg_1q, s2_reg_2i, s2_reg_2q, s2_reg_3i, s2_reg_3q;
    reg signed [15:0] s2_reg_4i, s2_reg_4q, s2_reg_5i, s2_reg_5q, s2_reg_6i, s2_reg_6q, s2_reg_7i, s2_reg_7q;
    
    wire s3_valid;

    // --- Stage 1: 4 Butterfly Units ---
    butterfly_unit bf1_0 ( .clk(clk), .rst_n(rst_n), .data_valid_in(start_ifft), .a_i(in0_i), .a_q(in0_q), .b_i(in4_i), .b_q(in4_q), .w_i(W0_I), .w_q(W0_Q), .x_i(s1_0i), .x_q(s1_0q), .y_i(s1_4i), .y_q(s1_4q), .data_valid_out(s1_valid) );
    butterfly_unit bf1_1 ( .clk(clk), .rst_n(rst_n), .data_valid_in(start_ifft), .a_i(in1_i), .a_q(in1_q), .b_i(in5_i), .b_q(in5_q), .w_i(W1_I), .w_q(W1_Q), .x_i(s1_1i), .x_q(s1_1q), .y_i(s1_5i), .y_q(s1_5q), .data_valid_out() );
    butterfly_unit bf1_2 ( .clk(clk), .rst_n(rst_n), .data_valid_in(start_ifft), .a_i(in2_i), .a_q(in2_q), .b_i(in6_i), .b_q(in6_q), .w_i(W2_I), .w_q(W2_Q), .x_i(s1_2i), .x_q(s1_2q), .y_i(s1_6i), .y_q(s1_6q), .data_valid_out() );
    butterfly_unit bf1_3 ( .clk(clk), .rst_n(rst_n), .data_valid_in(start_ifft), .a_i(in3_i), .a_q(in3_q), .b_i(in7_i), .b_q(in7_q), .w_i(W3_I), .w_q(W3_Q), .x_i(s1_3i), .x_q(s1_3q), .y_i(s1_7i), .y_q(s1_7q), .data_valid_out() );

    // Register stage between Stage 1 and 2
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) s1_reg_valid <= 1'b0; else s1_reg_valid <= s1_valid;
        if(s1_valid) begin
            {s1_reg_0i, s1_reg_0q} <= {s1_0i, s1_0q}; {s1_reg_1i, s1_reg_1q} <= {s1_1i, s1_1q};
            {s1_reg_2i, s1_reg_2q} <= {s1_2i, s1_2q}; {s1_reg_3i, s1_reg_3q} <= {s1_3i, s1_3q};
            {s1_reg_4i, s1_reg_4q} <= {s1_4i, s1_4q}; {s1_reg_5i, s1_reg_5q} <= {s1_5i, s1_5q};
            {s1_reg_6i, s1_reg_6q} <= {s1_6i, s1_6q}; {s1_reg_7i, s1_reg_7q} <= {s1_7i, s1_7q};
        end
    end

    // --- Stage 2: 4 Butterfly Units ---
    butterfly_unit bf2_0 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s1_reg_valid), .a_i(s1_reg_0i), .a_q(s1_reg_0q), .b_i(s1_reg_2i), .b_q(s1_reg_2q), .w_i(W0_I), .w_q(W0_Q), .x_i(s2_0i), .x_q(s2_0q), .y_i(s2_2i), .y_q(s2_2q), .data_valid_out(s2_valid) );
    butterfly_unit bf2_1 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s1_reg_valid), .a_i(s1_reg_1i), .a_q(s1_reg_1q), .b_i(s1_reg_3i), .b_q(s1_reg_3q), .w_i(W2_I), .w_q(W2_Q), .x_i(s2_1i), .x_q(s2_1q), .y_i(s2_3i), .y_q(s2_3q), .data_valid_out() );
    butterfly_unit bf2_2 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s1_reg_valid), .a_i(s1_reg_4i), .a_q(s1_reg_4q), .b_i(s1_reg_6i), .b_q(s1_reg_6q), .w_i(W0_I), .w_q(W0_Q), .x_i(s2_4i), .x_q(s2_4q), .y_i(s2_6i), .y_q(s2_6q), .data_valid_out() );
    butterfly_unit bf2_3 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s1_reg_valid), .a_i(s1_reg_5i), .a_q(s1_reg_5q), .b_i(s1_reg_7i), .b_q(s1_reg_7q), .w_i(W2_I), .w_q(W2_Q), .x_i(s2_5i), .x_q(s2_5q), .y_i(s2_7i), .y_q(s2_7q), .data_valid_out() );

    // Register stage between Stage 2 and 3
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) s2_reg_valid <= 1'b0; else s2_reg_valid <= s2_valid;
        if(s2_valid) begin
            {s2_reg_0i, s2_reg_0q} <= {s2_0i, s2_0q}; {s2_reg_1i, s2_reg_1q} <= {s2_1i, s2_1q};
            {s2_reg_2i, s2_reg_2q} <= {s2_2i, s2_2q}; {s2_reg_3i, s2_reg_3q} <= {s2_3i, s2_3q};
            {s2_reg_4i, s2_reg_4q} <= {s2_4i, s2_4q}; {s2_reg_5i, s2_reg_5q} <= {s2_5i, s2_5q};
            {s2_reg_6i, s2_reg_6q} <= {s2_6i, s2_6q}; {s2_reg_7i, s2_reg_7q} <= {s2_7i, s2_7q};
        end
    end

    // --- Stage 3: 4 Butterfly Units ---
    butterfly_unit bf3_0 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s2_reg_valid), .a_i(s2_reg_0i), .a_q(s2_reg_0q), .b_i(s2_reg_1i), .b_q(s2_reg_1q), .w_i(W0_I), .w_q(W0_Q), .x_i(out0_i), .x_q(out0_q), .y_i(out1_i), .y_q(out1_q), .data_valid_out(s3_valid) );
    butterfly_unit bf3_1 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s2_reg_valid), .a_i(s2_reg_2i), .a_q(s2_reg_2q), .b_i(s2_reg_3i), .b_q(s2_reg_3q), .w_i(W0_I), .w_q(W0_Q), .x_i(out2_i), .x_q(out2_q), .y_i(out3_i), .y_q(out3_q), .data_valid_out() );
    butterfly_unit bf3_2 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s2_reg_valid), .a_i(s2_reg_4i), .a_q(s2_reg_4q), .b_i(s2_reg_5i), .b_q(s2_reg_5q), .w_i(W0_I), .w_q(W0_Q), .x_i(out4_i), .x_q(out4_q), .y_i(out5_i), .y_q(out5_q), .data_valid_out() );
    butterfly_unit bf3_3 ( .clk(clk), .rst_n(rst_n), .data_valid_in(s2_reg_valid), .a_i(s2_reg_6i), .a_q(s2_reg_6q), .b_i(s2_reg_7i), .b_q(s2_reg_7q), .w_i(W0_I), .w_q(W0_Q), .x_i(out6_i), .x_q(out6_q), .y_i(out7_i), .y_q(out7_q), .data_valid_out() );

    // --- Output Control ---
    // The final data_ready signal is just the valid signal from the last stage.
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) data_ready <= 1'b0; else data_ready <= s3_valid;
    end

endmodule
