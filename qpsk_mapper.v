`timescale 1ns / 1ps
// This module maps 2 input bits to a QPSK symbol (I and Q components).

module qpsk_mapper (
    input      [1:0]  din,         // 2-bit data input
    output reg signed [7:0] dout_i,      // 8-bit signed I output
    output reg signed [7:0] dout_q       // 8-bit signed Q output
);

    // Use a case statement to map the input bits to I/Q values.
    // We use a value of '50' to represent '1.0' to leave room for future scaling.
    always @(*) begin
        case (din)
            2'b00: begin
                dout_i = 50;
                dout_q = 50;
            end
            2'b01: begin
                dout_i = -50;
                dout_q = 50;
            end
            2'b10: begin
                dout_i = -50;
                dout_q = -50;
            end
            2'b11: begin
                dout_i = 50;
                dout_q = -50;
            end
            default: begin
                dout_i = 0;
                dout_q = 0;
            end
        endcase
    end

endmodule