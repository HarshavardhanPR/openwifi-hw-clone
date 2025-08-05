`timescale 1 ns / 1 ps

module xpu_tb;

    // Parameters matching the xpu module
    localparam GPIO_STATUS_WIDTH = 8;
    localparam IQ_DATA_WIDTH = 16;
    localparam C_S00_AXI_DATA_WIDTH = 32;
    localparam C_S00_AXI_ADDR_WIDTH = 8;

    // Clock and Reset
    reg s00_axi_aclk;
    reg s00_axi_aresetn;

    // Inputs to xpu
    reg signed [(IQ_DATA_WIDTH-1):0] ddc_i;
    reg signed [(IQ_DATA_WIDTH-1):0] ddc_q;
    reg ddc_iq_valid;
    reg demod_is_ongoing;
    reg pkt_header_valid;
    reg pkt_header_valid_strobe;
    reg [7:0] pkt_rate;
    reg [15:0] pkt_len;
    reg byte_in_strobe;
    reg [7:0] byte_in;
    reg [15:0] byte_count;
    reg fcs_in_strobe;
    reg fcs_ok;
    reg phy_tx_start;
    reg phy_tx_started;
    reg phy_tx_done;
    reg tx_pkt_need_ack;

    // AXI-Lite Interface
    reg [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr;
    reg s00_axi_awvalid;
    wire s00_axi_awready;
    reg [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_wdata;
    reg s00_axi_wvalid;
    wire s00_axi_wready;
    wire [1:0] s00_axi_bresp;
    wire s00_axi_bvalid;
    reg s00_axi_bready;

    // Outputs from xpu
    wire start_tx_ack;
    wire ack_tx_flag;

    // Instantiate the Unit Under Test (UUT)
    xpu uut (
        // Connect all ports, tying unused ones to 0
        .gpio_status(8'd0),
        .ddc_i(ddc_i),
        .ddc_q(ddc_q),
        .ddc_iq_valid(ddc_iq_valid),
        .mute_adc_out_to_bb(),
        .block_rx_dma_to_ps(),
        .block_rx_dma_to_ps_valid(),
        .rssi_half_db_lock_by_sig_valid(),
        .gpio_status_lock_by_sig_valid(),
        .tsf_runtime_val(),
        .tsf_pulse_1M(),
        .rssi_half_db(),
        .demod_is_ongoing(demod_is_ongoing),
        .pkt_header_valid(pkt_header_valid),
        .pkt_header_valid_strobe(pkt_header_valid_strobe),
        .ht_unsupport(1'b0),
        .pkt_rate(pkt_rate),
        .pkt_len(pkt_len),
        .byte_in_strobe(byte_in_strobe),
        .byte_in(byte_in),
        .byte_count(byte_count),
        .fcs_in_strobe(fcs_in_strobe),
        .fcs_ok(fcs_ok),
        .n_ofdm_sym(15'd0),
        .n_bit_in_last_sym(10'd0),
        .phy_len_valid(1'b0),
        .rx_ht_aggr(1'b0),
        .rx_ht_aggr_last(1'b0),
        .demod_is_ongoing_led(),
        .cycle_start0_led(),
        .phy_tx_started_led(),
        .sig_valid_led(),
        .phy_tx_start(phy_tx_start),
        .phy_tx_started(phy_tx_started),
        .phy_tx_done(phy_tx_done),
        .tx_status(),
        .mac_addr(),
        .retrans_in_progress(),
        .start_retrans(),
        .start_tx_ack(start_tx_ack),
        .tx_try_complete(),
        .tx_iq_fifo_empty(1'b1),
        .slice_en(),
        .backoff_done(),
        .tx_bb_is_ongoing(),
        .tx_rf_is_ongoing(),
        .ack_tx_flag(ack_tx_flag),
        .wea(),
        .addra(),
        .dina(),
        .tx_pkt_need_ack(tx_pkt_need_ack),
        .tx_pkt_retrans_limit(4'd0),
        .tx_ht_aggr(1'b0),
        .douta(64'd0),
        .cts_toself_bb_is_ongoing(1'b0),
        .cts_toself_rf_is_ongoing(1'b0),
        .bram_addr(10'd0),
        .band(),
        .channel(),
        .quit_retrans(1'b0),
        .reset_backoff(1'b0),
        .tx_control_state_idle(),
        .num_slot_random(),
        .cw(),
        .high_trigger(1'b0),
        .tx_queue_idx(2'd0),
        .FC_DI(),
        .FC_DI_valid(),
        .addr1(),
        .addr1_valid(),
        .addr2(),
        .addr2_valid(),
        .addr3(),
        .addr3_valid(),
        .pkt_for_me(),
        .ch_idle_final(),
        .ps_clk(1'b0),
        .spi0_sclk(1'b0),
        .spi0_mosi(1'b0),
        .spi0_csn(1'b1),
        .spi_sclk(),
        .spi_csn(),
        .spi_mosi(),
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
        .s00_axi_bresp(s00_axi_bresp),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_araddr(8'd0),
        .s00_axi_arprot(3'd0),
        .s00_axi_arvalid(1'b0),
        .s00_axi_arready(),
        .s00_axi_rdata(),
        .s00_axi_rresp(),
        .s00_axi_rvalid(),
        .s00_axi_rready(1'b0)
    );

    // Clock generation
    initial begin
        s00_axi_aclk = 0;
        forever #5 s00_axi_aclk = ~s00_axi_aclk; // 100MHz
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
        s00_axi_bready <= 1;
        wait(s00_axi_bvalid);
        @(posedge s00_axi_aclk);
        s00_axi_bready <= 0;
    end
    endtask

    // PHY Packet Reception Task
    task phy_rx_packet(input integer len, input [7:0] rate);
    integer i;
    reg [7:0] mac_header [0:23];
    begin
        // Frame Control: Data Frame, To DS=0, From DS=1
        mac_header[0] = 8'h08; 
        mac_header[1] = 8'h02; 
        mac_header[2] = 8'h00; mac_header[3] = 8'h00; // Duration
        // Addr1 (DA): Our MAC address
        mac_header[4] = 8'hAA; mac_header[5] = 8'hBB; mac_header[6] = 8'hCC;
        mac_header[7] = 8'hDD; mac_header[8] = 8'hEE; mac_header[9] = 8'hFF;
        // Addr2 (SA): A source MAC
        mac_header[10] = 8'h11; mac_header[11] = 8'h22; mac_header[12] = 8'h33;
        mac_header[13] = 8'h44; mac_header[14] = 8'h55; mac_header[15] = 8'h66;
        // Addr3 (BSSID)
        mac_header[16] = 8'h77; mac_header[17] = 8'h88; mac_header[18] = 8'h99;
        mac_header[19] = 8'hAA; mac_header[20] = 8'hBB; mac_header[21] = 8'hCC;
        // Sequence Control
        mac_header[22] = 8'h00; mac_header[23] = 8'h00;

        $display("PHY RX Start: Simulating reception of a %0d-byte packet.", len);
        
        demod_is_ongoing = 1;
        ddc_iq_valid = 1;

        // 1. Signal Header Valid
        pkt_header_valid = 1;
        pkt_header_valid_strobe = 1;
        pkt_len = len;
        pkt_rate = rate;
        @(posedge s00_axi_aclk);
        pkt_header_valid = 0;
        pkt_header_valid_strobe = 0;
        
        // 2. Stream MAC Header and Payload bytes
        for (i = 0; i < len; i = i + 1) begin
            ddc_i <= $random;
            ddc_q <= $random;
            byte_in_strobe = 1;
            byte_count = i;
            if (i < 24) byte_in = mac_header[i];
            else byte_in = $random;
            @(posedge s00_axi_aclk);
        end
        byte_in_strobe = 0;

        // 3. Signal FCS (Frame Check Sequence) is valid
        fcs_in_strobe = 1;
        fcs_ok = 1;
        @(posedge s00_axi_aclk);
        fcs_in_strobe = 0;
        fcs_ok = 0;

        demod_is_ongoing = 0;
        ddc_iq_valid = 0;
        $display("PHY RX End: Packet simulation finished.");
    end
    endtask

    // Main Test Sequence
    initial begin
        // 1. Initialize all inputs to a known state
        $display("Initializing inputs...");
        s00_axi_aresetn = 1'b1; // Will be asserted low later
        ddc_i = 0;
        ddc_q = 0;
        ddc_iq_valid = 0;
        demod_is_ongoing = 0;
        pkt_header_valid = 0;
        pkt_header_valid_strobe = 0;
        pkt_rate = 0;
        pkt_len = 0;
        byte_in_strobe = 0;
        byte_in = 0;
        byte_count = 0;
        fcs_in_strobe = 0;
        fcs_ok = 0;
        phy_tx_start = 0;
        phy_tx_started = 0;
        phy_tx_done = 0;
        tx_pkt_need_ack = 0;
        s00_axi_awaddr = 0;
        s00_axi_awvalid = 0;
        s00_axi_wdata = 0;
        s00_axi_wvalid = 0;
        s00_axi_bready = 0;

        // 2. Reset the system
        $display("Starting Test: Resetting the system...");
        s00_axi_aresetn = 1'b0;
        #200;
        s00_axi_aresetn = 1'b1;
        $display("Reset released.");

        // 3. Configure the xpu via AXI-Lite
        $display("Configuring XPU via AXI-Lite...");
        // Set MAC Address (slv_reg30 and slv_reg31)
        axi_write(8'h78, 32'hDDCCBBAA); // Low 32 bits
        axi_write(8'h7C, 32'h0000FFEE); // High 16 bits
        // Set ACK timing parameters for 2.4GHz
        axi_write(8'h40, 32'h00140014); // slv_reg16
        axi_write(8'h48, 32'h0000000A); // slv_reg18
        // MODIFIED: Configure the packet filter to accept packets
        axi_write(8'h6C, 32'h00003FFF); // slv_reg27: Enable all frame types
        
        #100;

        // 4. Stimulus: Simulate receiving a packet that requires an ACK
        tx_pkt_need_ack = 1;
        phy_rx_packet(128, 8'h0B); // 128-byte packet, 6 Mbps rate

        // 5. Wait for the xpu to command an ACK transmission
        $display("Waiting for start_tx_ack...");
        wait (start_tx_ack);
        $display("start_tx_ack asserted! XPU is sending ACK.");
        
        // 6. Simulate the ACK transmission finishing
        #500;
        phy_tx_start = 1;
        phy_tx_started = 1;
        #100;
        phy_tx_done = 1;
        @(posedge s00_axi_aclk);
        phy_tx_start = 0;
        phy_tx_started = 0;
        phy_tx_done = 0;

        #500;
        $display("Test finished.");
        $finish;
    end

endmodule
