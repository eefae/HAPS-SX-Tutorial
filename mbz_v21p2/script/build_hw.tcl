# XSCT Command
# Create HDL Wrapper
make_wrapper -files [get_files ./vivado/hw.srcs/sources_1/bd/top/top.bd] -top
import_files -force -norecurse ./vivado/hw.gen/sources_1/bd/top/hdl/top_wrapper.v

# Import XDC
read_xdc ./src/constraints.xdc

# Relaunch synthesis
reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# Relaunch impmentation
#reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# Generate .xsa file
write_hw_platform -fixed -force ./vivado/hw/hw.xsa
