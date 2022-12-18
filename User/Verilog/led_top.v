//===============================================
//
//	File: led_top.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is used for LED top.
//
//===============================================

module led_top
#(
	parameter					LED_NUM
)
(
	input											clk,
	input											rstn,
	input 										key_up,
	input											key_down,

	output reg [LED_NUM-1:0]	led
);

// LED fsm state
localparam 									S0 = 5'b00001;
localparam 									S1 = 5'b00010;
localparam 									S2 = 5'b00100;
localparam 									S3 = 5'b01000;
localparam 									S4 = 5'b10000;

// LED fsm signal
reg	[4:0]										curr_st;
reg	[4:0]										next_st;

// 3 seg fsm
// Fisrt seg: state transition
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		curr_st <= S0;
	else
		curr_st <= next_st;
end

// Second seg: conditions for state transition
always @(posedge key_up or posedge key_down or negedge rstn)
begin
	if(!rstn)
		next_st = S0;
	else if(key_up)
		case (curr_st)
			S0: next_st = S1;
			S1: next_st = S2;
			S2: next_st = S3;
			S3: next_st = S4;
			S4: next_st = S0;
			default: next_st = S0;
		endcase
	else
		case (curr_st)
			S0: next_st = S4;
			S1: next_st = S0;
			S2: next_st = S1;
			S3: next_st = S2;
			S4: next_st = S3;
			default: next_st = S0;
		endcase
end

// Third seg: state output
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		led[LED_NUM-1:0] <= 0;
	else
		case (curr_st)
			S0: 
			begin
				led[LED_NUM-1:0] <= 0;
			end
			S1: 
			begin
				led[LED_NUM-1:1] <= 0;
				led[LED_NUM-1:0] <= 1'b1;
			end
			S2: 
			begin
				led[LED_NUM-2:0] <= 0;
				led[LED_NUM-1] <= 1'b1;
			end
			S3: 
			begin
				led[LED_NUM-1:0] <= ~0;//all 1, also using -1
			end
			S4: 
			begin
				led[LED_NUM-1:0] <= 0;
			end
			default: 
			begin
				led[LED_NUM-1:0] <= 0;
			end
		endcase
end

endmodule

