`timescale 1 ns / 1 ps

module xpu_tb;

    // Parameters for xpu module
    localparam GPIO_STATUS_WIDTH = 8;
    localparam DELAY_CTL_WIDTH = 7;
    localparam RSSI_HALF_DB_WIDTH = 11;
    localparam IQ_RSSI_HALF_DB_WIDTH = 9;
    localparam C_S00_AXIS_TDATA_WIDTH = 64;
    localparam IQ_DATA_WIDTH = 16;
    localparam WIFI_TX_BRAM_DATA_WIDTH = 64;
    localparam C_S00_AXI_DATA_WIDTH = 32;
    localparam C_S00_AXI_ADDR_WIDTH = 8;
    localparam TSF_TIMER_WIDTH = 64;
    localparam WIFI_TX_BRAM_ADDR_WIDTH = 10;

    // Testbench Registers
    reg s00_axi_aclk;
    reg s00_axi_aresetn;

    // Inputs to xpu
    reg [(GPIO_STATUS_WIDTH-1):0] gpio_status;
    reg signed [(IQ_DATA_WIDTH-1):0] ddc_i;
    reg signed [(IQ_DATA_WIDTH-1):0] ddc_q;
    reg ddc_iq_valid;
    reg demod_is_ongoing;
    reg pkt_header_valid;
    reg pkt_header_valid_strobe;
    reg ht_unsupport;
    reg [7:0] pkt_rate;
    reg [15:0] pkt_len;
    reg byte_in_strobe;
    reg [7:0] byte_in;
    reg [15:0] byte_count;
    reg fcs_in_strobe;
    reg fcs_ok;
    reg [14:0] n_ofdm_sym;
    reg [9:0]  n_bit_in_last_sym;
    reg phy_len_valid;
    reg rx_ht_aggr;
    reg rx_ht_aggr_last;
    reg phy_tx_start;
    reg phy_tx_started;
    reg phy_tx_done;
    reg tx_iq_fifo_empty;
    reg tx_pkt_need_ack;
    reg [3:0] tx_pkt_retrans_limit;
    reg tx_ht_aggr;
    reg [(WIFI_TX_BRAM_DATA_WIDTH-1):0] douta;
    reg cts_toself_bb_is_ongoing;
    reg cts_toself_rf_is_ongoing;
    reg [(WIFI_TX_BRAM_ADDR_WIDTH-1):0] bram_addr;
    reg quit_retrans;
    reg reset_backoff;
    reg high_trigger;
    reg [1:0] tx_queue_idx;
    reg ps_clk;
    reg spi0_sclk;
    reg spi0_mosi;
    reg spi0_csn;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr;
    reg [2 : 0] s00_axi_awprot;
    reg s00_axi_awvalid;
    reg [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata;
    reg [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb;
    reg s00_axi_wvalid;
    reg s00_axi_bready;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr;
    reg [2 : 0] s00_axi_arprot;
    reg s00_axi_arvalid;
    reg s00_axi_rready;

    // Outputs from xpu
    wire mute_adc_out_to_bb;
    wire block_rx_dma_to_ps;
    wire block_rx_dma_to_ps_valid;
    wire signed [(RSSI_HALF_DB_WIDTH-1):0] rssi_half_db_lock_by_sig_valid;
    wire [(GPIO_STATUS_WIDTH-1):0] gpio_status_lock_by_sig_valid;
    wire [(TSF_TIMER_WIDTH-1):0]  tsf_runtime_val;
    wire tsf_pulse_1M;
    wire signed [(RSSI_HALF_DB_WIDTH-1):0] rssi_half_db;
    wire demod_is_ongoing_led;
    wire cycle_start0_led;
    wire phy_tx_started_led;
    wire sig_valid_led;
    wire [79:0] tx_status;
    wire [47:0] mac_addr;
    wire retrans_in_progress;
    wire start_retrans;
    wire start_tx_ack;
    wire tx_try_complete;
    wire [3:0] slice_en;
    wire backoff_done;
    wire tx_bb_is_ongoing;
    wire tx_rf_is_ongoing;
    wire ack_tx_flag;
    wire wea;
    wire [9:0] addra;
    wire [(C_S00_AXIS_TDATA_WIDTH-1):0] dina;
    wire [3:0] band;
    wire [7:0] channel;
    wire tx_control_state_idle;
    wire [9:0] num_slot_random;
    wire [3:0] cw;
    wire [31:0] FC_DI;
    wire FC_DI_valid;
    wire [47:0] addr1;
    wire addr1_valid;
    wire [47:0] addr2;
    wire addr2_valid;
    wire [47:0] addr3;
    wire addr3_valid;
    wire pkt_for_me;
    wire ch_idle_final;
    wire spi_sclk;
    wire spi_csn;
    wire spi_mosi;
    wire s00_axi_awready;
    wire s00_axi_wready;
    wire [1 : 0] s00_axi_bresp;
    wire s00_axi_bvalid;
    wire s00_axi_arready;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata;
    wire [1 : 0] s00_axi_rresp;
    wire s00_axi_rvalid;


    // Instantiate the Unit Under Test (UUT)
    xpu #(
        .GPIO_STATUS_WIDTH(GPIO_STATUS_WIDTH),
        .DELAY_CTL_WIDTH(DELAY_CTL_WIDTH),
        .RSSI_HALF_DB_WIDTH(RSSI_HALF_DB_WIDTH),
        .IQ_RSSI_HALF_DB_WIDTH(IQ_RSSI_HALF_DB_WIDTH),
        .C_S00_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH),
        .IQ_DATA_WIDTH(IQ_DATA_WIDTH),
        .WIFI_TX_BRAM_DATA_WIDTH(WIFI_TX_BRAM_DATA_WIDTH),
        .C_S00_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
        .C_S00_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH),
        .TSF_TIMER_WIDTH(TSF_TIMER_WIDTH),
        .WIFI_TX_BRAM_ADDR_WIDTH(WIFI_TX_BRAM_ADDR_WIDTH)
    ) uut (
        .gpio_status(gpio_status),
        .ddc_i(ddc_i),
        .ddc_q(ddc_q),
        .ddc_iq_valid(ddc_iq_valid),
        .mute_adc_out_to_bb(mute_adc_out_to_bb),
        .block_rx_dma_to_ps(block_rx_dma_to_ps),
        .block_rx_dma_to_ps_valid(block_rx_dma_to_ps_valid),
        .rssi_half_db_lock_by_sig_valid(rssi_half_db_lock_by_sig_valid),
        .gpio_status_lock_by_sig_valid(gpio_status_lock_by_sig_valid),
        .tsf_runtime_val(tsf_runtime_val),
        .tsf_pulse_1M(tsf_pulse_1M),
        .rssi_half_db(rssi_half_db),
        .demod_is_ongoing(demod_is_ongoing),
        .pkt_header_valid(pkt_header_valid),
        .pkt_header_valid_strobe(pkt_header_valid_strobe),
        .ht_unsupport(ht_unsupport),
        .pkt_rate(pkt_rate),
        .pkt_len(pkt_len),
        .byte_in_strobe(byte_in_strobe),
        .byte_in(byte_in),
        .byte_count(byte_count),
        .fcs_in_strobe(fcs_in_strobe),
        .fcs_ok(fcs_ok),
        .n_ofdm_sym(n_ofdm_sym),
        .n_bit_in_last_sym(n_bit_in_last_sym),
        .phy_len_valid(phy_len_valid),
        .rx_ht_aggr(rx_ht_aggr),
        .rx_ht_aggr_last(rx_ht_aggr_last),
        .demod_is_ongoing_led(demod_is_ongoing_led),
        .cycle_start0_led(cycle_start0_led),
        .phy_tx_started_led(phy_tx_started_led),
        .sig_valid_led(sig_valid_led),
        .phy_tx_start(phy_tx_start),
        .phy_tx_started(phy_tx_started),
        .phy_tx_done(phy_tx_done),
        .tx_status(tx_status),
        .mac_addr(mac_addr),
        .retrans_in_progress(retrans_in_progress),
        .start_retrans(start_retrans),
        .start_tx_ack(start_tx_ack),
        .tx_try_complete(tx_try_complete),
        .tx_iq_fifo_empty(tx_iq_fifo_empty),
        .slice_en(slice_en),
        .backoff_done(backoff_done),
        .tx_bb_is_ongoing(tx_bb_is_ongoing),
        .tx_rf_is_ongoing(tx_rf_is_ongoing),
        .ack_tx_flag(ack_tx_flag),
        .wea(wea),
        .addra(addra),
        .dina(dina),
        .tx_pkt_need_ack(tx_pkt_need_ack),
        .tx_pkt_retrans_limit(tx_pkt_retrans_limit),
        .tx_ht_aggr(tx_ht_aggr),
        .douta(douta),
        .cts_toself_bb_is_ongoing(cts_toself_bb_is_ongoing),
        .cts_toself_rf_is_ongoing(cts_toself_rf_is_ongoing),
        .bram_addr(bram_addr),
        .band(band),
        .channel(channel),
        .quit_retrans(quit_retrans),
        .reset_backoff(reset_backoff),
        .tx_control_state_idle(tx_control_state_idle),
        .num_slot_random(num_slot_random),
        .cw(cw),
        .high_trigger(high_trigger),
        .tx_queue_idx(tx_queue_idx),
        .FC_DI(FC_DI),
        .FC_DI_valid(FC_DI_valid),
        .addr1(addr1),
        .addr1_valid(addr1_valid),
        .addr2(addr2),
        .addr2_valid(addr2_valid),
        .addr3(addr3),
        .addr3_valid(addr3_valid),
        .pkt_for_me(pkt_for_me),
        .ch_idle_final(ch_idle_final),
        .ps_clk(ps_clk),
        .spi0_sclk(spi0_sclk),
        .spi0_mosi(spi0_mosi),
        .spi0_csn(spi0_csn),
        .spi_sclk(spi_sclk),
        .spi_csn(spi_csn),
        .spi_mosi(spi_mosi),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awprot(s00_axi_awprot),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_bresp(s00_axi_bresp),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_arprot(s00_axi_arprot),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rresp(s00_axi_rresp),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_rready(s00_axi_rready)
    );

    // Clock generation
    initial begin
        s00_axi_aclk = 0;
        forever #5 s00_axi_aclk = ~s00_axi_aclk; // 100MHz clock
    end

    // AXI Write Task
    task axi_write(
        input [C_S00_AXI_ADDR_WIDTH-1:0] addr,
        input [C_S00_AXI_DATA_WIDTH-1:0] data
    );
    begin
        @(posedge s00_axi_aclk);
        s00_axi_awaddr <= addr;
        s00_axi_awvalid <= 1;
        s00_axi_wdata <= data;
        s00_axi_wvalid <= 1;
        s00_axi_wstrb <= 4'b1111;
        
        @(posedge s00_axi_aclk);
        while (~s00_axi_awready || ~s00_axi_wready) begin
            @(posedge s00_axi_aclk);
        end
        
        s00_axi_awvalid <= 0;
        s00_axi_wvalid <= 0;
        
        // Wait for write response
        s00_axi_bready <= 1;
        while (~s00_axi_bvalid) begin
            @(posedge s00_axi_aclk);
        end
        s00_axi_bready <= 0;
        @(posedge s00_axi_aclk);
    end
    endtask

    // PHY Packet Reception Task
    task phy_rx_packet(
        input integer len,
        input [7:0] rate
    );
    integer i;
    // Example MAC Header: Data frame to our MAC address from a source
    reg [7:0] mac_header [0:23];
    begin
        // Frame Control: Data Frame, To DS = 1, From DS = 0
        mac_header[0] = 8'h08; // Type: Data, Subtype: Data
        mac_header[1] = 8'h01; // Flags: To DS
        mac_header[2] = 8'h00; // Duration
        mac_header[3] = 8'h00;
        // Addr1 (RA - Receiver Address): Our MAC address
        mac_header[4] = 8'hAA; mac_header[5] = 8'hBB; mac_header[6] = 8'hCC;
        mac_header[7] = 8'hDD; mac_header[8] = 8'hEE; mac_header[9] = 8'hFF;
        // Addr2 (TA - Transmitter Address): A source MAC
        mac_header[10] = 8'h11; mac_header[11] = 8'h22; mac_header[12] = 8'h33;
        mac_header[13] = 8'h44; mac_header[14] = 8'h55; mac_header[15] = 8'h66;
        // Addr3 (DA - Destination Address): BSSID
        mac_header[16] = 8'h77; mac_header[17] = 8'h88; mac_header[18] = 8'h99;
        mac_header[19] = 8'hAA; mac_header[20] = 8'hBB; mac_header[21] = 8'hCC;
        // Sequence Control
        mac_header[22] = 8'h00; mac_header[23] = 8'h00;

        $display("PHY RX Start: Simulating reception of a %0d-byte packet.", len);
        
        // Assert demod_is_ongoing for the duration of the packet
        demod_is_ongoing = 1;

        // 1. Signal Header Valid
        pkt_header_valid = 1;
        pkt_header_valid_strobe = 1;
        pkt_len = len;
        pkt_rate = rate;
        @(posedge s00_axi_aclk);
        pkt_header_valid = 0;
        pkt_header_valid_strobe = 0;
        
        @(posedge s00_axi_aclk);

        // 2. Stream MAC Header and Payload bytes
        for (i = 0; i < len; i = i + 1) begin
            byte_in_strobe = 1;
            byte_count = i;
            if (i < 24) begin // Stream the MAC header
                byte_in = mac_header[i];
            end else begin // Stream dummy payload
                byte_in = $random;
            end
            @(posedge s00_axi_aclk);
        end
        byte_in_strobe = 0;

        #100;

        // 3. Signal FCS (Frame Check Sequence) is valid
        fcs_in_strobe = 1;
        fcs_ok = 1;
        @(posedge s00_axi_aclk);
        fcs_in_strobe = 0;
        fcs_ok = 0;

        // De-assert demod_is_ongoing after packet is done
        @(posedge s00_axi_aclk);
        demod_is_ongoing = 0;
        $display("PHY RX End: Packet simulation finished.");
    end
    endtask


    // Test stimulus
    initial begin
        // 1. Initialize all inputs to a known state
        $display("Initializing inputs...");
        gpio_status = 0; ddc_i = 0; ddc_q = 0; ddc_iq_valid = 0; demod_is_ongoing = 0;
        pkt_header_valid = 0; pkt_header_valid_strobe = 0; ht_unsupport = 0; pkt_rate = 0;
        pkt_len = 0; byte_in_strobe = 0; byte_in = 0; byte_count = 0; fcs_in_strobe = 0;
        fcs_ok = 0; n_ofdm_sym = 0; n_bit_in_last_sym = 0; phy_len_valid = 0; rx_ht_aggr = 0;
        rx_ht_aggr_last = 0; phy_tx_start = 0; phy_tx_started = 0; phy_tx_done = 0;
        tx_iq_fifo_empty = 1; tx_pkt_need_ack = 0; tx_pkt_retrans_limit = 0; tx_ht_aggr = 0;
        douta = 0; cts_toself_bb_is_ongoing = 0; cts_toself_rf_is_ongoing = 0; bram_addr = 0;
        quit_retrans = 0; reset_backoff = 0; high_trigger = 0; tx_queue_idx = 0; ps_clk = 0;
        spi0_sclk = 0; spi0_mosi = 0; spi0_csn = 1; s00_axi_awaddr = 0; s00_axi_awprot = 0;
        s00_axi_awvalid = 0; s00_axi_wdata = 0; s00_axi_wstrb = 0; s00_axi_wvalid = 0;
        s00_axi_bready = 0; s00_axi_araddr = 0; s00_axi_arprot = 0; s00_axi_arvalid = 0;
        s00_axi_rready = 0;

        // 2. Assert reset
        $display("Asserting reset...");
        s00_axi_aresetn = 0;
        #100; // Wait for 10 clock cycles

        // 3. De-assert reset
        $display("De-asserting reset. Simulation starts.");
        s00_axi_aresetn = 1;
        #50;

        // 4. AXI Configuration Sequence
        $display("Configuring XPU via AXI-Lite...");
        // Set MAC Address (slv_reg30 and slv_reg31)
        // MAC Addr: 0xFF_EE_DD_CC_BB_AA
        axi_write(8'h78, 32'hDDCCBBAA); // Low 32 bits
        axi_write(8'h7C, 32'h0000FFEE); // High 16 bits
        
        // Enable NAV, DIFS, EIFS, CW (slv_reg6)
        axi_write(8'h18, 32'h00000000); 

        // Set ACK timing parameters for 2.4GHz (slv_reg16 and slv_reg18)
        axi_write(8'h40, 32'h00140014); // recv_ack_timeout_top_adj and recv_ack_sig_valid_timeout_top
        axi_write(8'h48, 32'h0000000A); // send_ack_wait_top (SIFS)

        // Set packet filter to accept all valid packets (slv_reg27)
        axi_write(8'h6C, 32'h00000001); // filter_on = 1

        #100;

        // 5. Stimulus: Simulate receiving a packet using the new task
        phy_rx_packet(64, 8'h0B); // 64-byte packet, 6 Mbps rate

        #1000;

        // 6. End simulation
        $display("Simulation finished.");
        $finish;
    end

endmodule
