@echo off
set project=VHLD_processor
vivado -mode batch -source ./tcl/make_fpga.tcl -tclargs build %project%