# ============================================================================
# Tcl script for Vivado SIMULATION (Disk-based Project)
# ============================================================================

# --- 1. Project Setup ---
puts "INFO: Creating simulation project on disk..."

# Define the project name and directory
set proj_name "ofdm_simulation"
set proj_dir "./vivado_sim_project"

# Clean up old project directory if it exists for a fresh run
if { [file isdirectory $proj_dir] } {
    file delete -force $proj_dir
}

# Create a project on disk instead of in-memory
create_project $proj_name $proj_dir -part xc7z020clg484-1


# --- 2. Add Source Files ---
puts "INFO: Adding Verilog source files..."

# Add the design file (serializer.v)
# The path must be relative to the Tcl script location
add_files -norecurse ./serializer.v

# Add the testbench file (tb_serializer.v) to the simulation-only fileset
add_files -fileset sim_1 -norecurse ./tb_serializer.v


# --- 3. Configure and Launch Simulation ---
puts "INFO: Configuring and launching simulation..."

# Set the testbench file as the top-level module for the simulation
set_property top tb_serializer [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Launch the simulation.
launch_simulation


# --- 4. Run the Simulation ---
puts "INFO: Running simulation... Testbench output will follow."

# Execute the simulation until a `$stop` or `$finish` command is hit
run all


# --- 5. Clean Up ---
puts "INFO: Simulation finished. Closing project."
close_project
exit