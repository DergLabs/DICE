## This file is to run with the Machine Learning strategy recommendation (for non-project mode) .

set RQSFile "C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/i_impl_1_1_rqs/strategy_util/checkpoint_cleanup_utilization_placedSuggestionFile1.rqs"

read_qor_suggestions $RQSFile
opt_design -directive RQS
place_design -directive RQS
phys_opt_design -directive RQS
route_design -directive RQS

