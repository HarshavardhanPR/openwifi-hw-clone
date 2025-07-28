// tb_serializer.v
`timescale 1ns / 1ps

module tb_serializer;

    // Inputs
    reg clk;
    reg rst_n;
    reg load_en;
    reg [15:0] p_in;

    // Outputs
    wire [1:0] s_out;
    wire       data_valid;

    // Instantiate the Unit Under Test (UUT)
    serializer uut (
        .clk(clk),
        .rst_n(rst_n),
        .load_en(load_en),
        .p_in(p_in),
        .s_out(s_out),
        .data_valid(data_valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period, 100MHz clock
    end

    // Test stimulus
    initial begin
        $display("Time\t rst_n\t load_en\t p_in\t\t data_valid\t s_out");
        $monitor("%0t\t %b\t %b\t\t %h\t %b\t\t %b", $time, rst_n, load_en, p_in, data_valid, s_out);

        // 1. Reset the system
        rst_n   = 1'b0;
        load_en = 1'b0;
        p_in    = 16'h0;
        #20;
        rst_n   = 1'b1;
        #10;

        // 2. Load data and start serialization
        $display("--> Loading data 16'hABCD...");
        load_en = 1'b1;
        p_in    = 16'hABCD;
        #10;
        load_en = 1'b0;

        // 3. Wait for serialization to complete (8 cycles * 10ns = 80ns)
        #80;

        // 4. Load another value
        $display("--> Loading data 16'h1234...");
        load_en = 1'b1;
        p_in    = 16'h1234;
        #10;
        load_en = 1'b0;

        #80;
        $display("--> Test finished.");

        // Add this line to stop the simulation
        #20; // Add a small delay to let the last monitor print
        $finish;
    end

endmodule