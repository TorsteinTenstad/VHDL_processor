set project_dir project/$project

# Cleanup previous project
if { [catch current_project $project_dir ] } {
    puts stderr "Project $project does not exist\n"
} else {
    close_project -delete
}

file delete -force ./$project_dir

# Create project
create_project ${project} ./${project_dir}

# Create additional output directory that will hold logs
# and final bit file
set outputDir ./project/$project/output
set outputDirDos project\\$project\\output
file mkdir $outputDir

# Use maximum number of core (8)
set_param general.maxThreads 8

# Set project properties
set obj [current_project]
#set_property -name "corecontainer.enable" 	-value "1" 		-objects $obj
#set_property -name "default_lib" 			-value "work" 	-objects $obj
set_property -name "target_language" 		-value "VHDL" 	-objects $obj
#set_property -name "ip_output_repo"         -value "./ip"   -objects $obj
#set_property target_simulator MODELSIM [current_project]

# Disable webtalk
config_webtalk -user off

# Specify location of Custom IP
#set vivado_ip_paths project/$project/ip
#set_property ip_repo_paths  [list ${vivado_ip_paths}] [current_fileset]

#update_ip_catalog

# Remove some warnings
set_msg_config -suppress -id {SIM-utils-52}

puts "INFO: Project created:$project_dir"
