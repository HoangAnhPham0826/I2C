
# Create Project

create_project -force -name vc707 -part xc7vx485tffg1761-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add project commands


# Add Sources

read_verilog {/home/enty/project/linux-on-litex-vexriscv/adder.v}
read_verilog {/home/enty/project/pythondata-cpu-vexriscv-smp/pythondata_cpu_vexriscv_smp/verilog/Ram_1w_1rs_Generic.v}
read_verilog {/home/enty/project/pythondata-cpu-vexriscv-smp/pythondata_cpu_vexriscv_smp/verilog/VexRiscvLitexSmpCluster_Cc1_Iw32Is4096Iy1_Dw32Ds4096Dy1_ITs4DTs4_Ldw256_Ood_Hb1.v}
read_verilog {/home/enty/project/linux-on-litex-vexriscv/build/vc707/gateware/vc707.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc vc707.xdc
set_property PROCESSING_ORDER EARLY [get_files vc707.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top vc707 -part xc7vx485tffg1761-2

# Synthesis report

report_timing_summary -file vc707_timing_synth.rpt
report_utilization -hierarchical -file vc707_utilization_hierarchical_synth.rpt
report_utilization -file vc707_utilization_synth.rpt
write_checkpoint -force vc707_synth.dcp

# Add pre-optimize commands


# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file vc707_utilization_hierarchical_place.rpt
report_utilization -file vc707_utilization_place.rpt
report_io -file vc707_io.rpt
report_control_sets -verbose -file vc707_control_sets.rpt
report_clock_utilization -file vc707_clock_utilization.rpt
write_checkpoint -force vc707_place.dcp

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force vc707_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file vc707_route_status.rpt
report_drc -file vc707_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file vc707_timing.rpt
report_power -file vc707_power.rpt

# Bitstream generation

write_bitstream -force vc707.bit 

# End

quit