onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fifo_tb/u_top/u_fifo_top/clk_25m
add wave -noupdate /fifo_tb/u_top/u_fifo_top/clk_50m
add wave -noupdate /fifo_tb/u_top/u_fifo_top/rstn
add wave -noupdate /fifo_tb/u_top/u_fifo_top/key_press
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_state
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_wr_req
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_wr_full
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_wr_empty
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_wr_data
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_wr_usedw
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_rd_req
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_rd_full
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_rd_empty
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_rd_data
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_rd_usedw
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_enable
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_clk
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_clk
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rstn
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_en
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_req
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_en
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_req
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_empty
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_full
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/data
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_addr
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_bin
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_gray_next
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_bin_next
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_ptr
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_rptr1
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_rptr2
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/q
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_addr
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_bin
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_bin_next
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_ptr
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_wptr1
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_gray_next
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_wptr2
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/rd_empty_val
add wave -noupdate /fifo_tb/u_top/u_fifo_top/fifo_async_inst/wr_full_val
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {736659 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {641710 ps} {930592 ps}
