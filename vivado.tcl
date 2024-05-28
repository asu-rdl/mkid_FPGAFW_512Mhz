#-----------------------------------------------------------
# Vivado v2021.1 (64-bit)
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
# Start of session at: Mon May 27 23:47:26 2024
# Process ID: 456726
# Current directory: ./mKID_FPGAFW
# Command line: vivado
# Log file: ./vivado.log
# Journal file: ./vivado.jou
#-----------------------------------------------------------
start_gui
create_project vivadoprj ./vivadoprj -part xczu28dr-ffvg1517-2-e
set_property board_part xilinx.com:zcu111:part0:1.4 [current_project]
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
add_files {./src/eth_buffer/counterN.vhdl ./src/eth_buffer/falling_edge_detect.vhdl ./src/eth_regs/eth_regs_v1_0_S00_AXI.vhd ./src/eth_regs/eth_regs_v1_0.vhd ./src/bram_addr.vhd ./src/regN/basicObj.vhd ./src/timestamp.vhd ./src/gigabit_udp_tx/byte_data.vhd ./src/mymux.vhd ./src/redge_latch.vhd ./src/gigabit_udp_tx/rgmii_rx.vhd ./src/eth_buffer/or2.vhdl ./src/gigabit_udp_tx/add_preamble.vhd ./src/mux/mux.vhdl ./src/gigabit_udp_tx/eth_top_v2.vhd ./src/eth_buffer/eth_buffer.vhdl ./src/eth_buffer/edge_detect.vhdl ./src/eth_buffer/and2.vhdl ./src/mux_4port.vhd ./src/rising_edge/rise_edge.vhdl ./src/delay.vhd ./src/d_flip/d_flip.vhdl ./src/eth_buffer/accumN.vhdl ./src/dsp_regs/dsp_regs_v1_0.vhd ./src/gigabit_udp_tx/rgmii_tx.vhd ./src/dsp_regs/dsp_regs_v1_0_S00_AXI.vhd ./src/gigabit_udp_tx/add_crc32.vhd}
add_files -fileset constrs_1 -norecurse ./constraints/constraints.xdc
update_compile_order -fileset sources_1
set_property  ip_repo_paths  ./ip_repo [current_project]
update_ip_catalog
source ./bram_lutwave.tcl
delete_bd_objs [get_bd_addr_segs] [get_bd_addr_segs -excluded]
assign_bd_address -import_from_file ./vivado_address_assignments.csv
make_wrapper -files [get_files ./vivadoprj/vivadoprj.srcs/sources_1/bd/bram_lutwave/bram_lutwave.bd] -top
add_files -norecurse ./vivadoprj/vivadoprj.gen/sources_1/bd/bram_lutwave/hdl/bram_lutwave_wrapper.vhd
update_compile_order -fileset sources_1
# Disabling source management mode.  This is to allow the top design properties to be set without GUI intervention.
set_property source_mgmt_mode None [current_project]
set_property top bram_lutwave_wrapper [current_fileset]
# Re-enabling previously disabled source management mode.
set_property source_mgmt_mode All [current_project]
update_compile_order -fileset sources_1
launch_runs impl_1 -to_step write_bitstream -jobs 16
wait_on_run impl_1
write_hw_platform -fixed -include_bit -force -file /home/cody/Desktop/mKID_FPGAFW/vivadoprj/bitstream.xsa
exec mv vivadoprj/bitstream.xsa vivadoprj/bitstream.zip
exec unzip ./vivadoprj/bitstream.zip
exec mv bram_lutwave.hwh bitstream.hwh
exec rm -f zcu111_board.jpeg xsa.xml xsa.json sysdef.xml bram_lutwave.tcl bram_lutwave_ddr4_0_0_microblaze_mcs.hwh bram_lutwave.bda bitstream.mmi
exec rm -f psu_init.c
exec rm -f psu_init.h
exec rm -f psu_init.htm
exec rm -f psu_init.tcl
exec rm -f psu_init_gpl.c
exec rm -f psu_init_gpl.h
exec rm -f psu_init_gpl.htm
exec rm -f psu_init.html
