proc make_fpga { project } {

    # Setup project
    source ./tcl/setup_prj.tcl

    # Add common procedure
    #source ./tcl/proc.tcl

    # Add source files
    source ./tcl/read_src.tcl

    # Set top level
    #set_property top fpga_ZC702 [current_fileset]
    #set_property top_file {../vhdl/fpga_ZC702.vhd} [current_fileset]

    #update_compile_order -fileset sources_1
    #update_compile_order -fileset sim_1

    # Export all support files for all IPs in the design for simulation
    #export_ip_user_files -no_script

    variable project_name
    set project_name ${project}

    # Start GUI, can be used later for running additional reports etc..
    start_gui
}

make_fpga [lindex $argv 1]