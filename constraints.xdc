# ============================================================================
# Xilinx Design Constraints (XDC) for Zynq-7020
#
# IMPORTANT: You MUST uncomment and edit these settings to match your specific
# board's documentation (e.g., for ZedBoard, Zybo, etc.).
# ============================================================================

# --- 1. Clock Signal ---
# This creates a 100MHz clock constraint. The pin location Y9 is the
# system clock on the ZedBoard. Change this to your board's clock pin.
set_property -dict { PACKAGE_PIN Y9   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports clk]

# --- 2. Reset Signal ---
# Assign the reset pin. L16 is a push button on the ZedBoard.
 set_property -dict { PACKAGE_PIN L16  IOSTANDARD LVCMOS33 } [get_ports rst_n]

# --- 3. Parallel Input Pins (p_in) ---
# Connect the 16 p_in bits to 16 switches or other inputs.
# These are examples using the switches on the ZedBoard.
set_property -dict { PACKAGE_PIN F22  IOSTANDARD LVCMOS33 } [get_ports {p_in[0]}]
set_property -dict { PACKAGE_PIN G22  IOSTANDARD LVCMOS33 } [get_ports {p_in[1]}]
set_property -dict { PACKAGE_PIN H22  IOSTANDARD LVCMOS33 } get_ports {p_in[2]}]
set_property -dict { PACKAGE_PIN F21  IOSTANDARD LVCMOS33 } [get_ports {p_in[3]}]
# ... and so on for all 16 bits

# --- 4. Serial Output Pins (s_out) ---
# Connect the 2 s_out bits to LEDs or other outputs.
# These are examples using two LEDs on the ZedBoard.
 set_property -dict { PACKAGE_PIN T22  IOSTANDARD LVCMOS33 } get_ports {s_out[0]}]
set_property -dict { PACKAGE_PIN T21  IOSTANDARD LVCMOS33 } get_ports {s_out[1]}]

# --- 5. Control Signals ---
# Connect load_en and data_valid to a button and an LED.
 set_property -dict { PACKAGE_PIN G19  IOSTANDARD LVCMOS33 } [get_ports load_en]
set_property -dict { PACKAGE_PIN U14  IOSTANDARD LVCMOS33 } [get_ports data_valid]