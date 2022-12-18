//===============================================
//
//	File: key.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is used for KEY debounce.
//
//===============================================

module key_top
#(
	parameter							KEY_NUM = 4
)
(
	input									clk,
	input									rstn,
	input [KEY_NUM-1:0]		key,

	output [KEY_NUM-1:0]	key_value,
	output [KEY_NUM-1:0]	key_press
);

// 4 keys debounce
genvar							key_num;

generate
	for(key_num = 0; key_num < KEY_NUM; key_num = key_num + 1)
	begin : key_lable
		key u_key
		(
			.clk							(clk),
			.rstn							(rstn),
			.key							(key[key_num]),
			.key_value				(key_value[key_num]),
			.key_press				(key_press[key_num])
		);
	end
endgenerate

endmodule

