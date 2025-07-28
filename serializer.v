// serializer.v (Final Corrected Version)
`timescale 1ns / 1ps
module serializer (
    input                 clk,
    input                 rst_n,
    input                 load_en,
    input      [15:0]     p_in,
    output     [1:0]      s_out,
    output reg            data_valid
);

    reg [15:0] shift_reg;
    reg [2:0]  count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_valid <= 1'b0;
            count      <= 3'b0;
            shift_reg  <= 16'b0;
        end else if (load_en) begin
            shift_reg  <= p_in;
            data_valid <= 1'b1;
            count      <= 3'b0;
        end else if (data_valid) begin
            shift_reg <= shift_reg << 2;
            count     <= count + 1;
            if (count == 3'd7) begin
                data_valid <= 1'b0;
            end
        end
    end

    assign s_out = shift_reg[15:14];

endmodule