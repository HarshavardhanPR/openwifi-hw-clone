`timescale 1 ns / 1 ps

module tx_intf_tb;

    // Parameters
    localparam C_S00_AXI_DATA_WIDTH = 32;
    localparam C_S00_AXI_ADDR_WIDTH = 7;
    localparam C_S00_AXIS_TDATA_WIDTH = 64;

    // Clocks and Resets
    reg s00_axi_aclk;
    reg s00_axi_aresetn;
    reg dac_clk;
    reg dac_rst;

    // AXI-Stream Interface (from DMA)
    reg  s00_axis_tvalid;
    reg  [C_S00_AXIS_TDATA_WIDTH-1:0] s00_axis_tdata;
    reg  s00_axis_tlast;
    wire s00_axis_tready;

    // AXI-Lite Interface (for configuration)
    reg [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr;
    reg s00_axi_awvalid;
    wire s00_axi_awready;
    reg [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_wdata;
    reg s00_axi_wvalid;
    wire s00_axi_wready;
    wire [1:0] s00_axi_bresp;
    wire s00_axi_bvalid;
    reg s00_axi_bready;

    // Inputs from XPU
    reg backoff_done;
    reg [3:0] slice_en;
    reg tx_try_complete;
    reg [79:0] tx_status;
    reg [47:0] mac_addr_from_xpu;

    // Inputs from PHY (openofdm_tx)
    reg [(10-1):0] bram_addr;
    reg signed [(16-1):0] rf_i_from_acc;
    reg signed [(16-1):0] rf_q_from_acc;
    reg rf_iq_valid_from_acc;
    reg tx_start_from_acc;
    reg tx_end_from_acc;

    // Outputs from UUT
    wire phy_tx_start;
    wire [(2*16-1) : 0] iq0_for_check;
    wire [(2*16-1) : 0] iq1_for_check;
    wire iq_valid_for_check;
    wire tx_hold;
    wire [63:0] data_to_acc;
    wire [9:0] bram_addr_to_xpu;
    wire tx_itrpt;
    wire tx_itrpt_led;
    wire tx_end_led;
    wire [63:0] douta;
    wire tx_iq_fifo_empty;
    wire tx_bb_is_ongoing;
    wire tx_pkt_need_ack;
    wire [3:0] tx_pkt_retrans_limit;
    wire use_ht_aggr;
    wire tx_control_state_idle;
    wire cts_toself_bb_is_ongoing;
    wire cts_toself_rf_is_ongoing;
    wire quit_retrans;
    wire reset_backoff;
    wire high_trigger;
    wire [1:0] tx_queue_idx_to_xpu;


    // Instantiate the Unit Under Test (UUT)
    tx_intf uut (
        .dac_rst(dac_rst),
        .dac_clk(dac_clk),
        .dma_valid(), // Unused in this test
        .dma_data(), // Unused in this test
        .dma_ready(), // Unused in this test
        .dac_valid(),
        .dac_data(),
        .dac_ready(1'b1),
        .iq0_for_check(iq0_for_check),
        .iq1_for_check(iq1_for_check),
        .iq_valid_for_check(iq_valid_for_check),
        .fcs_in_strobe(1'b0),
        .phy_tx_start(phy_tx_start),
        .tx_hold(tx_hold),
        .bram_addr(bram_addr),
        .rf_i_from_acc(rf_i_from_acc),
        .rf_q_from_acc(rf_q_from_acc),
        .rf_iq_valid_from_acc(rf_iq_valid_from_acc),
        .data_to_acc(data_to_acc),
        .bram_addr_to_xpu(bram_addr_to_xpu),
        .tx_start_from_acc(tx_start_from_acc),
        .tx_end_from_acc(tx_end_from_acc),
        .tx_itrpt(tx_itrpt),
        .tx_itrpt_led(tx_itrpt_led),
        .tx_end_led(tx_end_led),
        .tx_status(tx_status),
        .mac_addr(mac_addr_from_xpu),
        .douta(douta),
        .tx_iq_fifo_empty(tx_iq_fifo_empty),
        .slice_en(slice_en),
        .backoff_done(backoff_done),
        .tx_bb_is_ongoing(tx_bb_is_ongoing),
        .ack_tx_flag(1'b0),
        .wea_from_xpu(1'b0),
        .addra_from_xpu(10'd0),
        .dina_from_xpu(64'd0),
        .tx_pkt_need_ack(tx_pkt_need_ack),
        .tx_pkt_retrans_limit(tx_pkt_retrans_limit),
        .use_ht_aggr(use_ht_aggr),
        .tx_try_complete(tx_try_complete),
        .num_slot_random(10'd0),
        .cw(4'd0),
        .retrans_in_progress(1'b0),
        .start_retrans(1'b0),
        .start_tx_ack(1'b0),
        .tx_control_state_idle(tx_control_state_idle),
        .cts_toself_bb_is_ongoing(cts_toself_bb_is_ongoing),
        .cts_toself_rf_is_ongoing(cts_toself_rf_is_ongoing),
        .tsf_pulse_1M(1'b0),
        .band(4'd1), // 2.4 GHz
        .channel(8'd6),
        .quit_retrans(quit_retrans),
        .reset_backoff(reset_backoff),
        .high_trigger(high_trigger),
        .tx_queue_idx_to_xpu(tx_queue_idx_to_xpu),
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
        .s00_axi_araddr(7'd0),
        .s00_axi_arprot(3'd0),
        .s00_axi_arvalid(1'b0),
        .s00_axi_arready(),
        .s00_axi_rdata(),
        .s00_axi_rresp(),
        .s00_axi_rvalid(),
        .s00_axi_rready(1'b0),
        .s00_axis_aclk(s00_axi_aclk),
        .s00_axis_aresetn(s00_axi_aresetn),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tstrb(8'hFF),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tvalid(s00_axis_tvalid),
        .tsf_runtime_val(64'd0)
    );

    // Clock generation
    initial begin
        s00_axi_aclk = 0;
        forever #5 s00_axi_aclk = ~s00_axi_aclk; // 100MHz
    end
    initial begin
        dac_clk = 0;
        forever #12.5 dac_clk = ~dac_clk; // 40MHz
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
        @(posedge s00_axi_aclk);
        while (~s00_axi_awready || ~s00_axi_wready) begin
            @(posedge s00_axi_aclk);
        end
        s00_axi_awvalid <= 0;
        s00_axi_wvalid <= 0;
        s00_axi_bready <= 1;
        while (~s00_axi_bvalid) begin
            @(posedge s00_axi_aclk);
        end
        s00_axi_bready <= 0;
    end
    endtask

    // AXI-Stream Send Task
    task axis_send_packet(
        input integer num_words
    );
    integer i;
    begin
        for (i = 0; i < num_words; i = i + 1) begin
            @(posedge s00_axi_aclk);
            s00_axis_tvalid <= 1;
            s00_axis_tdata <= {$random, $random};
            s00_axis_tlast <= (i == num_words - 1);
            wait (s00_axis_tready);
        end
        @(posedge s00_axi_aclk);
        s00_axis_tvalid <= 0;
        s00_axis_tlast <= 0;
    end
    endtask

    // Main Test Sequence
    initial begin
        // 1. Reset the system
        $display("Starting Test: Resetting the system...");
        s00_axi_aresetn = 1'b0;
        dac_rst = 1'b1;
        s00_axis_tvalid = 1'b0;
        s00_axis_tlast = 1'b0;
        backoff_done = 1'b0;
        slice_en = 4'b0;
        tx_try_complete = 1'b0;
        s00_axi_awvalid = 0;
        s00_axi_wvalid = 0;
        s00_axi_bready = 0;
        mac_addr_from_xpu = 48'hAABBCCDDEEFF;
        tx_start_from_acc = 1'b0;
        tx_end_from_acc = 1'b0;
        #200;
        s00_axi_aresetn = 1'b1;
        dac_rst = 1'b0;
        $display("Reset released.");

        // 2. Configure the tx_intf via AXI-Lite
        $display("Configuring tx_intf...");
        // MODIFIED: Added configuration for slv_reg2
        axi_write(7'h08, 32'h0000_0018); // slv_reg2: auto_start_mode = 1, num_dma_symbol_th = 1
        axi_write(7'h20, 32'h0001_4000); // slv_reg8: tx_config (need_ack=1, queue_idx=1)
        axi_write(7'h44, 32'h000B_8064); // slv_reg17: phy_hdr_config (100 bytes, 6Mbps, HT)

        #100;
        
        // 3. Simulate the XPU granting permission to transmit
        $display("XPU grants permission to transmit...");
        slice_en = 4'b1111; // Enable all queues
        #20; // Wait a couple of cycles
        backoff_done = 1'b1; // CSMA/CA is complete
        @(posedge s00_axi_aclk);
        backoff_done = 1'b0;

        // 4. Now that permission is granted, simulate the DMA sending the packet
        $display("Simulating DMA transfer of a packet...");
        axis_send_packet(16); // Send a 16 * 8 = 128-byte packet
        $display("DMA transfer complete.");

        // 5. Wait for the transmission to start
        $display("Waiting for phy_tx_start...");
        wait (phy_tx_start);
        $display("phy_tx_start asserted! Transmission has begun.");

        #2000;

        // 6. Simulate the PHY finishing the transmission
        $display("Simulating end of transmission from PHY...");
        tx_end_from_acc = 1'b1;
        @(posedge s00_axi_aclk);
        tx_end_from_acc = 1'b0;

        #100;

        // 7. Simulate XPU signaling completion
        $display("Simulating tx_try_complete from XPU...");
        tx_try_complete = 1'b1;
        @(posedge s00_axi_aclk);
        tx_try_complete = 1'b0;

        #500;

        $display("Test finished.");
        $finish;
    end

endmodule
