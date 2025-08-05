#*****************************************************************************************
# Xianjun jiao. putaoshu@msn.com; xianjun.jiao@imec.be;
#
# Vivado (TM) v2017.4.1 (64-bit) - Modified for Vivado 2021.1 and ZC702_FMCS2
#
# rx_intf.tcl: Tcl script for re-creating project 'rx_intf'
#
#*****************************************************************************************

#-----------process arguments (if exist)-------
set ARGUMENT1 [lindex $argv 0]
set ARGUMENT2 [lindex $argv 1]
set ARGUMENT3 [lindex $argv 2]
set ARGUMENT4 [lindex $argv 3]
set ARGUMENT5 [lindex $argv 4]
set ARGUMENT6 [lindex $argv 5]
set ARGUMENT7 [lindex $argv 6]

if {$ARGUMENT1 eq ""} {
  # MODIFIED: Default BOARD_NAME to zc702_fmcs2
  set BOARD_NAME zc702_fmcs2
} else {
  set BOARD_NAME $ARGUMENT1
}

if {$ARGUMENT2 eq ""} {
  set NUM_CLK_PER_US 100
} else {
  set NUM_CLK_PER_US $ARGUMENT2
}

source ../parse_board_name.tcl

set MODULE_NAME RX_INTF
set  fd  [open  "./src/rx_intf_pre_def.v"  w]
if {$ARGUMENT3 eq ""} {
  puts $fd " "
} else {
  puts $fd "`define $MODULE_NAME\_$ARGUMENT3"
}
if {$ARGUMENT4 eq ""} {
  puts $fd " "
} else {
  puts $fd "`define $MODULE_NAME\_$ARGUMENT4"
}
if {$ARGUMENT5 eq ""} {
  puts $fd " "
} else {
  puts $fd "`define $MODULE_NAME\_$ARGUMENT5"
}
if {$ARGUMENT6 eq ""} {
  puts $fd " "
} else {
  puts $fd "`define $MODULE_NAME\_$ARGUMENT6"
}
if {$ARGUMENT7 eq ""} {
  puts $fd " "
} else {
  puts $fd "`define $MODULE_NAME\_$ARGUMENT7"
}
close $fd
#-----end of process arguments (if exist)-------

puts "BOARD_NAME $BOARD_NAME"
puts "NUM_CLK_PER_US $NUM_CLK_PER_US"
puts "ultra_scale_flag $ultra_scale_flag"
puts "part_string $part_string"
puts "fpga_size_flag $fpga_size_flag"

# -----------generate clock_speed.v---------------
set  fd  [open  "./src/clock_speed.v"  w]
puts $fd "`define NUM_CLK_PER_US $NUM_CLK_PER_US"
close $fd
file copy -force ../board_def.v ./src/board_def.v
# ----end of generate clock_speed.v---------------

# Set the reference directory for source file relative paths
set origin_dir "."
set project_name "rx_intf"

# MODIFIED: Robust project cleanup
catch {close_sim}
if {[get_projects -quiet] != ""} {
    close_project
}
if {[file isdirectory $project_name]} {
    file delete -force -- $project_name
}

# Create project
create_project ${project_name} ./${project_name} -part $part_string

# Set project properties
set obj [current_project]
# MODIFIED: Set the correct board_part for ZC702_FMCS2
set_property -name "board_part" -value "xilinx.com:zc702:part0:1.4" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "target_language" -value "Verilog" -objects $obj
set_property -name "target_simulator" -value "XSim" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/src/adc_intf.v"]"\
 "[file normalize "$origin_dir/src/byte_to_word_fcs_sn_insert.v"]"\
 "[file normalize "$origin_dir/src/edge_to_flip.v"]"\
 "[file normalize "$origin_dir/src/gpio_status_rf_to_bb.v"]"\
 "[file normalize "$origin_dir/src/mv_avg.v"]"\
 "[file normalize "$origin_dir/src/mv_avg_dual_ch.v"]"\
 "[file normalize "$origin_dir/src/rx_iq_intf.v"]"\
 "[file normalize "$origin_dir/src/rx_intf_m_axis.v"]"\
 "[file normalize "$origin_dir/src/rx_intf_pl_to_m_axis.v"]"\
 "[file normalize "$origin_dir/src/rx_intf_s_axi.v"]"\
 "[file normalize "$origin_dir/src/rx_intf.v"]"\
]
add_files -norecurse -fileset $obj $files
set_property top rx_intf $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}
set obj [get_filesets sim_1]
# MODIFIED: Add the testbench to the simulation set
add_files -fileset $obj [list "[file normalize "$origin_dir/src/rx_intf_tb.v"]"]
# MODIFIED: Set the testbench as the top module for simulation
set_property top rx_intf_tb $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part $part_string -flow {Vivado Synthesis 2021} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
}
set obj [get_runs synth_1]
set_property "steps.synth_design.args.flatten_hierarchy" "rebuilt" -objects $obj
set_property "steps.synth_design.args.gated_clock_conversion" "off" -objects $obj
set_property "steps.synth_design.args.bufg" "12" -objects $obj
set_property "steps.synth_design.args.fanout_limit" "10000" -objects $obj
set_property "steps.synth_design.args.directive" "Default" -objects $obj
set_property "steps.synth_design.args.retiming" "0" -objects $obj
set_property "steps.synth_design.args.fsm_extraction" "auto" -objects $obj
set_property "steps.synth_design.args.keep_equivalent_registers" "0" -objects $obj
set_property "steps.synth_design.args.resource_sharing" "auto" -objects $obj
set_property "steps.synth_design.args.control_set_opt_threshold" "auto" -objects $obj
set_property "steps.synth_design.args.no_lc" "0" -objects $obj
set_property "steps.synth_design.args.no_srlextract" "0" -objects $obj
set_property "steps.synth_design.args.shreg_min_size" "3" -objects $obj
set_property "steps.synth_design.args.max_bram" "-1" -objects $obj
set_property "steps.synth_design.args.max_uram" "-1" -objects $obj
set_property "steps.synth_design.args.max_dsp" "-1" -objects $obj
set_property "steps.synth_design.args.max_bram_cascade_height" "-1" -objects $obj
set_property "steps.synth_design.args.max_uram_cascade_height" "-1" -objects $obj
set_property "steps.synth_design.args.cascade_dsp" "auto" -objects $obj
set_property "steps.synth_design.args.assert" "0" -objects $obj

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part $part_string -flow {Vivado Implementation 2021} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
}
set obj [get_runs impl_1]
set_property "steps.opt_design.args.directive" "Default" -objects $obj
set_property "steps.place_design.args.directive" "Default" -objects $obj
set_property "steps.phys_opt_design.args.directive" "Default" -objects $obj
set_property "steps.route_design.args.directive" "Default" -objects $obj
set_property "steps.write_bitstream.args.bin_file" "0" -objects $obj

current_run -implementation [get_runs impl_1]
puts "INFO: Project created: $project_name"
