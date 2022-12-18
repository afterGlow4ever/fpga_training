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

module key
(
	input							clk,
	input							rstn,
	input							key,

	output reg				key_value,
	output						key_press
);

// Key debounce
reg [31:0]					delay_cnt;
reg									key_reg;

// Key press detect
wire								key_press_temp;

// Debounce
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
	begin
		key_reg <= 1'b1;
		delay_cnt <= 32'd0;
	end
	else
	begin
		key_reg <= key;
		if(key_reg != key)
			delay_cnt <= 32'd10;
		else if(key_reg == key)
			if(delay_cnt > 32'd0)
				delay_cnt <= delay_cnt - 1'b1;
			else
				delay_cnt <= delay_cnt;
	end
end

always @(posedge clk or negedge rstn)
begin 
	if(!rstn)
		key_value <= 1'b1;
	else if(delay_cnt == 32'd1)
		key_value <= key;
	else
		key_value <= key_value;		
end

// Key press detect
assign key_press = key_press_temp & rstn;//In case of tri-state when reseting

negedge_detect u_negedge_detect
(
	.clk							(clk),
	.rstn							(rstn),
	.A								(key_value),
	.Y								(key_press_temp)
);

endmodule
