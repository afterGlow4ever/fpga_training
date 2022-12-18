transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/researchprogram/altera/13.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {c:/researchprogram/altera/13.1/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {top_8_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+D:/project/fpga_training/Project/Fpga_syn/fpga_trainning/../../../Sim/Fpga_sim/TB {D:/project/fpga_training/Project/Fpga_syn/fpga_trainning/../../../Sim/Fpga_sim/TB/led_tb_gate.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  led_tb_gate

add wave *
view structure
view signals
run -all
