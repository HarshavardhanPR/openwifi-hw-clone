#*****************************************************************************************
# Xianjun jiao. putaoshu@msn.com; xianjun.jiao@imec.be;
#
# Vivado (TM) v2017.4.1 (64-bit) - Modified for Vivado 2021.1 and ZC702_FMCS2
#
# xpu.tcl: Tcl script for re-creating project 'xpu'
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

set MODULE_NAME XPU
set  fd  [open  "./src/xpu_pre_def.v"  w]
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

# -----------generate openwifi_hw_git_rev.v---------------
set  fd  [open  "./src/openwifi_hw_git_rev.v"  w]
if {[file exists "../../get_git_rev.sh"]} {
  # MODIFIED: Explicitly use 'sh' to execute the shell script on Windows
  set HASHCODE [exec sh ../../get_git_rev.sh]
  puts $fd "`define OPENWIFI_HW_GIT_REV (32'h$HASHCODE)"
} else {
  puts "WARNING: ../../get_git_rev.sh not found. openwifi_hw_git_rev.v will contain a placeholder."
  puts $fd "`define OPENWIFI_HW_GIT_REV (32'hDEADBEEF)"
}
close $fd
# ----end of generate openwifi_hw_git_rev.v---------------

# ---------generate spi_command.v---------------------------
set  fd  [open  "./src/spi_command.v"  w]
puts $fd "`define SPI_HIGH 24'hC22001"
puts $fd "`define SPI_LOW 24'hC02001"
close $fd
# ---------end of generate spi_command.v--------------------

set origin_dir "."
set project_name "xpu"
# If a project is already open, close it
if {[get_projects -quiet] != ""} {
    # MODIFIED: Removed the '-force' option which is not compatible with all Vivado versions
    close_project
}
# Remove the old project directory
# MODIFIED: Use Tcl's built-in file delete for better portability and error handling
if {[file isdirectory $project_name]} {
    file delete -force -- $project_name
}


create_project ${project_name} ./${project_name} -part $part_string

set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
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
 "[file normalize "$origin_dir/src/cca.v"]"\
 "[file normalize "$origin_dir/src/csma_ca.v"]"\
 "[file normalize "$origin_dir/src/dc_rm.v"]"\
 "[file normalize "$origin_dir/src/fifo_sample_delay.v"]"\
 "[file normalize "$origin_dir/src/iq_abs_avg.v"]"\
 "[file normalize "$origin_dir/src/iq_rssi_to_db.v"]"\
 "[file normalize "$origin_dir/src/mv_avg.v"]"\
 "[file normalize "$origin_dir/src/mv_avg_dual_ch.v"]"\
 "[file normalize "$origin_dir/src/n_sym_len14_pkt.v"]"\
 "[file normalize "$origin_dir/src/phy_rx_parse.v"]"\
 "[file normalize "$origin_dir/src/pkt_filter_ctl.v"]"\
 "[file normalize "$origin_dir/src/rssi.v"]"\
 "[file normalize "$origin_dir/src/spi.v"]"\
 "[file normalize "$origin_dir/src/time_slice_gen.v"]"\
 "[file normalize "$origin_dir/src/tsf_timer.v"]"\
 "[file normalize "$origin_dir/src/tx_control.v"]"\
 "[file normalize "$origin_dir/src/tx_on_detection.v"]"\
 "[file normalize "$origin_dir/src/xpu_s_axi.v"]"\
 "[file normalize "$origin_dir/src/xpu.v"]"\
 "[file normalize "$origin_dir/src/cw_exp.v"]"\
 "[file normalize "$origin_dir/src/edge_to_flip.v"]"\
]
add_files -norecurse -fileset $obj $files
set_property -name "top" -value "xpu" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}
set obj [get_filesets sim_1]
# MODIFIED: Add the EXISTING mv_avg testbench to the simulation set
set files [list \
 "[file normalize "$origin_dir/unit_test/mv_avg/mv_avg_tb.v"]"\
]
add_files -norecurse -fileset $obj $files

# MODIFIED: Set the top-level simulation module to the mv_avg testbench
set_property -name "top" -value "mv_avg_tb" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part $part_string -flow {Vivado Synthesis 2021} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
}

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part $part_string -flow {Vivado Implementation 2021} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
}

# Set current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created: $project_name"
