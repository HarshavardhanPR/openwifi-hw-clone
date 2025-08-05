`timescale 1 ns / 1 ps

module rx_intf_tb;

    // Parameters
    localparam C_S00_AXI_DATA_WIDTH = 32;
    localparam C_S00_AXI_ADDR_WIDTH = 7;
    localparam C_M00_AXIS_TDATA_WIDTH = 64;
    localparam IQ_DATA_WIDTH = 16;
    localparam GPIO_STATUS_WIDTH = 8;
    localparam RSSI_HALF_DB_WIDTH = 11;

    // Clocks and Resets
    reg s00_axi_aclk;
    reg s00_axi_aresetn;
    reg adc_clk;
    reg adc_rst;

    // Inputs to UUT
    reg [(4*IQ_DATA_WIDTH-1):0] adc_data;
    reg adc_valid;
    reg [(GPIO_STATUS_WIDTH-1):0] gpio_status_rf;
    reg pkt_header_valid;
    reg pkt_header_valid_strobe;
    reg [7:0] pkt_rate;
    reg [15:0] pkt_len;
    reg byte_in_strobe;
    reg [7:0] byte_in;
    reg [15:0] byte_count;
    reg fcs_in_strobe;
    reg fcs_ok;
    reg block_rx_dma_to_ps;
    reg block_rx_dma_to_ps_valid;
    reg m00_axis_tready;

    // AXI-Lite Interface
    reg [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr;
    reg s00_axi_awvalid;
    wire s00_axi_awready;
    reg [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_wdata;
    reg s00_axi_wvalid;
    wire s00_axi_wready;

    // Outputs from UUT
    wire m00_axis_tvalid;
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] m00_axis_tdata;
    wire m00_axis_tlast;
    wire phy_tx_start;

    // Instantiate the Unit Under Test (UUT)
    rx_intf uut (
        .adc_clk(adc_clk),
        .adc_rst(adc_rst),
        .adc_data(adc_data),
        .adc_valid(adc_valid),
        .gpio_status_rf(gpio_status_rf),
        .gpio_status_bb(),
        .iq0_from_tx_intf(32'd0),
        .iq1_from_tx_intf(32'd0),
        .iq_valid_from_tx_intf(1'b0),
        .sample0(),
        .sample1(),
        .sample_strobe(),
        .pkt_header_valid(pkt_header_valid),
        .pkt_header_valid_strobe(pkt_header_valid_strobe),
        .ht_unsupport(1'b0),
        .pkt_rate(pkt_rate),
        .pkt_len(pkt_len),
        .ht_aggr(1'b0),
        .ht_aggr_last(1'b0),
        .ht_sgi(1'b0),
        .byte_in_strobe(byte_in_strobe),
        .byte_in(byte_in),
        .byte_count(byte_count),
        .fcs_in_strobe(fcs_in_strobe),
        .fcs_ok(fcs_ok),
        .fcs_ok_led(),
        .rx_pkt_intr(),
        .s2mm_intr(1'b0),
        .mute_adc_out_to_bb(1'b0),
        .block_rx_dma_to_ps(block_rx_dma_to_ps),
        .block_rx_dma_to_ps_valid(block_rx_dma_to_ps_valid),
        .rssi_half_db_lock_by_sig_valid(11'd0),
        .gpio_status_lock_by_sig_valid(8'd0),
        .tsf_runtime_val(64'd0),
        .tsf_pulse_1M(1'b0),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awprot(3'd0),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(4'hF),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_bresp(),
        .s00_axi_bvalid(),
        .s00_axi_bready(1'b1),
        .s00_axi_araddr(7'd0),
        .s00_axi_arprot(3'd0),
        .s00_axi_arvalid(1'b0),
        .s00_axi_arready(),
        .s00_axi_rdata(),
        .s00_axi_rresp(),
        .s00_axi_rvalid(),
        .s00_axi_rready(1'b0),
        .m00_axis_aclk(s00_axi_aclk),
        .m00_axis_aresetn(s00_axi_aresetn),
        .m00_axis_tvalid(m00_axis_tvalid),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tstrb(),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tready(m00_axis_tready)
    );

    // Clock generation
    initial begin
        s00_axi_aclk = 0;
        forever #5 s00_axi_aclk = ~s00_axi_aclk; // 100MHz
    end
    initial begin
        adc_clk = 0;
        forever #12.5 adc_clk = ~adc_clk; // 40MHz
    end

    // AXI Write Task
    task axi_write(input [C_S00_AXI_ADDR_WIDTH-1:0] addr, input [C_S00_AXI_DATA_WIDTH-1:0] data);
    begin
        @(posedge s00_axi_aclk);
        s00_axi_awaddr <= addr;
        s00_axi_awvalid <= 1;
        s00_axi_wdata <= data;
        s00_axi_wvalid <= 1;
        @(posedge s00_axi_aclk);
        wait (s00_axi_awready && s00_axi_wready);
        s00_axi_awvalid <= 0;
        s00_axi_wvalid <= 0;
    end
    endtask

    // Main Test Sequence
    initial begin
        integer i;

        // 1. Reset the system
        $display("Starting Test: Resetting the system...");
        s00_axi_aresetn = 1'b0;
        adc_rst = 1'b1;
        adc_valid = 0;
        pkt_header_valid = 0;
        pkt_header_valid_strobe = 0;
        byte_in_strobe = 0;
        fcs_in_strobe = 0;
        block_rx_dma_to_ps = 0;
        block_rx_dma_to_ps_valid = 0;
        m00_axis_tready = 0;
        #200;
        s00_axi_aresetn = 1'b1;
        adc_rst = 1'b0;
        $display("Reset released.");

        // 2. Configure the rx_intf
        axi_write(7'h0C, 32'h0000_0000); // slv_reg3: Disable loopback
        axi_write(7'h14, 32'h0000_0000); // slv_reg5: Use fcs_valid for start_1trans_mode

        // 3. Enable AXI slave and wait for ADC data to flow
        $display("Enabling AXI DMA slave and waiting for ADC data...");
        m00_axis_tready = 1;
        #1000;

        // 4. Simulate a packet being decoded by the PHY
        $display("Simulating PHY packet decode...");
        pkt_header_valid = 1;
        pkt_header_valid_strobe = 1;
        pkt_len = 128; // 128-byte packet
        pkt_rate = 8'h0B; // 6 Mbps
        @(posedge s00_axi_aclk);
        pkt_header_valid = 0;
        pkt_header_valid_strobe = 0;

        // Stream the bytes of the packet
        for (i = 0; i < 128; i = i + 1) begin
            @(posedge s00_axi_aclk);
            byte_in_strobe = 1;
            byte_in = i;
            byte_count = i;
            @(posedge s00_axi_aclk);
            byte_in_strobe = 0;
        end

        // Signal end of packet with good FCS
        fcs_in_strobe = 1;
        fcs_ok = 1;
        @(posedge s00_axi_aclk);
        fcs_in_strobe = 0;
        fcs_ok = 0;
        $display("PHY decode finished.");

        #100;

        // 5. Simulate XPU giving permission to send to DMA
        $display("XPU grants permission to forward packet...");
        block_rx_dma_to_ps_valid = 1;
        block_rx_dma_to_ps = 1;
        @(posedge s00_axi_aclk);
        block_rx_dma_to_ps_valid = 0;
        block_rx_dma_to_ps = 0;

        // 6. Wait for the packet to be transferred on the AXI-Stream bus
        $display("Waiting for packet on AXI-Stream output...");
        wait (m00_axis_tvalid && m00_axis_tlast);
        $display("Packet successfully transferred to DMA!");
        
        #500;
        $display("Test finished.");
        $finish;
    end

    // ADC Data Generator (runs in parallel with the main sequence)
    initial begin
        // Wait for reset to finish before starting
        wait (s00_axi_aresetn == 1'b1);
        forever begin
            @(posedge adc_clk);
            adc_valid <= 1;
            adc_data <= {$random, $random};
        end
    end

endmodule
