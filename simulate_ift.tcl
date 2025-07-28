# Tcl script for simulating the 8-point IFFT

puts "INFO: Creating IFFT simulation project..."
set proj_dir "./vivado_sim_project"

# Clean up any old project files for a fresh run
if { [file isdirectory $proj_dir] } {
    file delete -force $proj_dir
}
create_project ifft_sim $proj_dir -part xc7z020clg484-1

# Add the required design files: the IFFT core and its butterfly unit
puts "INFO: Adding design files: ifft_8_point.v, butterfly_unit.v"
add_files -norecurse ./ifft_8_point.v
add_files -norecurse ./butterfly_unit.v

# Add the IFFT testbench
puts "INFO: Adding testbench: tb_ifft_8_point.v"
add_files -fileset sim_1 -norecurse ./tb_ifft_8_point.v

# Set the IFFT testbench as the top-level module for the simulation
set_property top tb_ifft_8_point [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Launch and run the simulation to completion
puts "INFO: Launching simulation..."
launch_simulation
run all

puts "INFO: Simulation finished."
close_project
exit
