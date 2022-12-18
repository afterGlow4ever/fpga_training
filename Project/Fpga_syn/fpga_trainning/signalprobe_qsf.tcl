# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.


# Quartus II 64-Bit Version 13.1.0 Build 162 10/23/2013 SJ Full Version
# File: signalprobe_qsf.tcl
# Generated on: Sun Jan 10 21:13:01 2021

# Note: This file contains a Tcl script generated from the SignalProbe Gui.
#       You can use this script to restore SignalProbes after deleting the DB
#       folder; at the command line use "quartus_cdb -t signalprobe_qsf.tcl".

package require ::quartus::chip_planner
package require ::quartus::project
project_open top -revision top
read_netlist
set had_failure 0

############
# Index: 1 #
############
set result [ make_sp  -src_name "key_top:u_key_top|key:key_lable\[3\].u_key|key_value" -loc PIN_L1 -pin_name "key_top:u_key_top|key:key_lable\[3\].u_key|key_value_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (key_top:u_key_top|key:key_lable\[3\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[3\].u_key|key_value\" -loc PIN_L1 -pin_name \"key_top:u_key_top|key:key_lable\[3\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (key_top:u_key_top|key:key_lable\[3\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[3\].u_key|key_value\" -loc PIN_L1 -pin_name \"key_top:u_key_top|key:key_lable\[3\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} 

############
# Index: 2 #
############
set result [ make_sp  -src_name "key_top:u_key_top|key:key_lable\[2\].u_key|key_value" -loc PIN_L2 -pin_name "key_top:u_key_top|key:key_lable\[2\].u_key|key_value_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (key_top:u_key_top|key:key_lable\[2\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[2\].u_key|key_value\" -loc PIN_L2 -pin_name \"key_top:u_key_top|key:key_lable\[2\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (key_top:u_key_top|key:key_lable\[2\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[2\].u_key|key_value\" -loc PIN_L2 -pin_name \"key_top:u_key_top|key:key_lable\[2\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} 

############
# Index: 3 #
############
set result [ make_sp  -src_name "key_top:u_key_top|key:key_lable\[1\].u_key|key_value" -loc PIN_N1 -pin_name "key_top:u_key_top|key:key_lable\[1\].u_key|key_value_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (key_top:u_key_top|key:key_lable\[1\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[1\].u_key|key_value\" -loc PIN_N1 -pin_name \"key_top:u_key_top|key:key_lable\[1\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (key_top:u_key_top|key:key_lable\[1\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[1\].u_key|key_value\" -loc PIN_N1 -pin_name \"key_top:u_key_top|key:key_lable\[1\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} 

############
# Index: 4 #
############
set result [ make_sp  -src_name "key_top:u_key_top|key:key_lable\[0\].u_key|key_value" -loc PIN_N2 -pin_name "key_top:u_key_top|key:key_lable\[0\].u_key|key_value_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (key_top:u_key_top|key:key_lable\[0\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[0\].u_key|key_value\" -loc PIN_N2 -pin_name \"key_top:u_key_top|key:key_lable\[0\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (key_top:u_key_top|key:key_lable\[0\].u_key|key_value_signalProbe): make_sp  -src_name \"key_top:u_key_top|key:key_lable\[0\].u_key|key_value\" -loc PIN_N2 -pin_name \"key_top:u_key_top|key:key_lable\[0\].u_key|key_value_signalProbe\" -io_std \"2.5 V\""
} 

############
# Index: 5 #
############
set result [ make_sp  -src_name "clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]" -loc PIN_P1 -pin_name "clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]_signalProbe): make_sp  -src_name \"clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]\" -loc PIN_P1 -pin_name \"clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]_signalProbe): make_sp  -src_name \"clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]\" -loc PIN_P1 -pin_name \"clock_tree:u_clock_tree|pll1:pll1_inst|altpll:altpll_component|pll1_altpll:auto_generated|wire_pll1_clk\[1\]_signalProbe\" -io_std \"2.5 V\""
} 

