set run_name [lindex $argv 0]
set flow_name [lindex $argv 1]
set synth_run_name ""
if { $argc >= 3 } {
  lappend synth_run_name [lindex $argv 2]
}
set util_1_fs_path [file join [file join [get_property directory [current_project]] [get_property name [current_project]].srcs] utils_1]
set util_fs_run_path [file join $util_1_fs_path $run_name]
set proj_dir [get_property directory [get_runs i_impl_1_1]]
create_run $run_name -parent_run $synth_run_name -flow $flow_name
set rqs_files []
lappend rqs_files [add_files -fileset [get_filesets utils_1] -copy_to $util_fs_run_path -force ${proj_dir}/stage1_suggestions.rqs]
lappend rqs_files [add_files -fileset [get_filesets utils_1] -copy_to $util_fs_run_path -force ${proj_dir}/stage2_suggestions.rqs]
set_property RQS_FILES $rqs_files [get_runs $run_name]
set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE RQS [get_runs $run_name]
set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE RQS [get_runs $run_name]
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs $run_name]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE RQS [get_runs $run_name]
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE RQS [get_runs $run_name]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs $run_name]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs $run_name]
