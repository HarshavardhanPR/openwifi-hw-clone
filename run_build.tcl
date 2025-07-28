# ============================================================================
# Tcl script for Vivado project build
# ============================================================================

# --- 1. Project Setup ---
puts "INFO: Creating project..."

# Define the target FPGA part.
# xc7z020clg484-1 is the Zynq-7020 on boards like the ZedBoard.
set part_name "xc7z020clg484-1"

# Define the top-level module of our design.
# For now, we'll just synthesize the serializer.
set top_module "serializer"

# Create a directory for the build output
file mkdir ./build

# Create an in-memory project. This is faster than creating project files on disk.
create_project -in_memory -part $part_name

# --- 2. Add Source Files ---
puts "INFO: Adding source files..."

# Add all Verilog files from the current directory.
# We will eventually combine our modules into one top-level file.
add_files [glob ./*.v]

# Add the constraints file. This is CRITICAL for any real hardware build.
add_files [glob ./*.xdc]

# --- 3. Run Synthesis ---
puts "INFO: Running Synthesis..."
synth_design -top $top_module -part $part_name

# Write out reports for checking results
write_checkpoint -force ./build/post_synth.dcp
report_timing_summary -file ./build/post_synth_timing_summary.rpt
report_utilization -file ./build/post_synth_utilization.rpt

# --- 4. Run Implementation ---
puts "INFO: Running Implementation..."
opt_design
place_design
route_design

# Write out reports for checking results
write_checkpoint -force ./build/post_impl.dcp
report_timing_summary -file ./build/post_impl_timing_summary.rpt
report_utilization -file ./build/post_impl_utilization.rpt
report_drc -file ./build/post_impl_drc.rpt

# --- 5. Generate Bitstream ---
puts "INFO: Generating bitstream..."
write_bitstream -force ./build/${top_module}.bit

puts "INFO: Tcl script finished."