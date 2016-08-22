
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name seven_segment0-99 -dir "F:/VLSI PROJECTS/seven_segment0-99/planAhead_run_2" -part xc3s100ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "F:/VLSI PROJECTS/seven_segment0-99/seven_segment.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {F:/VLSI PROJECTS/seven_segment0-99} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "seven_segment.ucf" [current_fileset -constrset]
add_files [list {seven_segment.ucf}] -fileset [get_property constrset [current_run]]
link_design
