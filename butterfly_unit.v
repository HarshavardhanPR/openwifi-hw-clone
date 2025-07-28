`timescale 1ns / 1ps
// Corrected version of the butterfly unit

module butterfly_unit (
    input clk,
    input rst_n,
    input data_valid_in,

    // Two complex number inputs
    input signed [7:0] a_i, a_q,
    input signed [7:0] b_i, b_q,

    // Twiddle factor (complex constant)
    input signed [7:0] w_i, w_q,

    // THE FIX: Outputs assigned in an always block must be 'reg'
    output reg signed [15:0] x_i, x_q,
    output reg signed [15:0] y_i, y_q,
    output reg           data_valid_out
);

    // --- Internal Registers for Pipelining ---

    // Pipeline Stage 1: Perform the 4 multiplications for (B * W)
    reg signed [15:0] p1_br_wr, p1_bi_wi, p1_br_wi, p1_bi_wr;
    reg signed [7:0]  p1_a_i, p1_a_q;
    reg               p1_valid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p1_valid <= 1'b0;
        end else begin
            p1_valid <= data_valid_in;
            if (data_valid_in) begin
                p1_a_i <= a_i;
                p1_a_q <= a_q;
                p1_br_wr <= b_i * w_i;
                p1_bi_wi <= b_q * w_q;
                p1_br_wi <= b_i * w_q;
                p1_bi_wr <= b_q * w_i;
            end
        end
    end

    // Pipeline Stage 2: Calculate the real and imaginary parts of (B * W)
    reg signed [15:0] p2_bw_real, p2_bw_imag;
    reg signed [15:0] p2_a_i, p2_a_q;
    reg               p2_valid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p2_valid <= 1'b0;
        end else begin
            p2_valid <= p1_valid;
            if (p1_valid) begin
                p2_a_i <= p1_a_i;
                p2_a_q <= p1_a_q;
                p2_bw_real <= p1_br_wr - p1_bi_wi;
                p2_bw_imag <= p1_br_wi + p1_bi_wr;
            end
        end
    end

    // Pipeline Stage 3 (Output Stage): Calculate final X and Y
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_valid_out <= 1'b0;
            // Initialize outputs to 0 on reset
            x_i <= 0; x_q <= 0; y_i <= 0; y_q <= 0;
        end else begin
            data_valid_out <= p2_valid;
            if (p2_valid) begin
                x_i <= p2_a_i + p2_bw_real;
                x_q <= p2_a_q + p2_bw_imag;
                y_i <= p2_a_i - p2_bw_real;
                y_q <= p2_a_q - p2_bw_imag;
            end
        end
    end

endmodule
