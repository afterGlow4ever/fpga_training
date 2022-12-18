//===============================================
//
//	File: top.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is top module for fpga training..
//
//===============================================

`timescale 1ns/1ps

module top 
(
	input							sys_clk,
	input							sys_rstn,
	input [ 3:0]			key,

	output [ 3:0]			led
);

// Parameters
parameter						KEY_NUM = 4;
parameter						LED_NUM = 2;

// PLL
wire								clk_50m;
wire								clk_25m;
wire								pll_locked;

// Key signal
wire [KEY_NUM-1:0]	key_value;
wire [KEY_NUM-1:0]	key_press;

// System init signal
wire								sys_init_done;

// System
assign sys_init_done = sys_rstn & pll_locked;

clock_tree u_clock_tree
(
	.sys_clk					(sys_clk),
	.sys_rstn					(sys_rstn),
	.clk_50m					(clk_50m),
	.clk_25m					(clk_25m),
	.pll_locked				(pll_locked)
);

// RAM top
ram_top u_ram_top
(
	.clk_25m					(clk_25m),
	.clk_50m					(clk_50m),
	.rstn							(sys_init_done),
	.key_press				(key_press[0]),

	.ram_state				(led[3])
);

// FIFO top
fifo_top u_fifo_top
(
	.clk_25m					(clk_25m),
	.clk_50m					(clk_50m),
	.rstn							(sys_init_done),
	.key_press				(key_press[1]),

	.fifo_state				(led[2])
);

// Key top
key_top
#(
	KEY_NUM
)u_key_top
(
	.clk							(clk_50m),
	.rstn							(sys_init_done),
	.key							(key),
	.key_value				(key_value),
	.key_press				(key_press)
);

// LED top
led_top
#(
	LED_NUM
)u_led_top
(
	.clk							(clk_25m),
	.rstn							(sys_init_done),
	.key_up						(key_press[3]),
	.key_down					(key_press[2]),

	.led							(led[1:0])
);

endmodule

















