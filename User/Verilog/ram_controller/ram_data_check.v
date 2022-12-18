//===============================================
//
//	File: ram_data_check.v
//	Author: afterGlow,4ever
//	Date: 05232022
//	Version: v1.0
//
// 	This file is used to check data for RAM.
//
//===============================================

module ram_data_check
(
	input									clk,
	input									rstn,

	input									ram_rd_en,
	input [ 4:0]					ram_rd_addr,
	input	[ 7:0]					ram_rd_data,

	output reg						ram_data_error
);

// Counter for data
reg  [ 5:0]							ram_rd_cnt;

// Data check
reg  [ 7:0]					ram_data_temp;
wire [ 7:0]					ram_data_temp_d;
reg									ram_data_error_temp;

// Data valid in 0~31
//assign ram_rd_en = ((ram_rd_cnt >= 6'd0) && (ram_rd_cnt <= 6'd31) && rstn) ? 1'b1 : 1'b0;

// Read ram in 0~31
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_rd_cnt <= 6'd0;
	else if(ram_rd_cnt == 6'd63)
		ram_rd_cnt <= ram_rd_cnt;
	else
		ram_rd_cnt <= ram_rd_cnt + 1'b1;
end

// RAM data for check
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_data_temp <= 8'd0;
	else if((ram_rd_cnt >= 6'd0 && ram_rd_cnt < 6'd31) && ram_rd_en)
		ram_data_temp <= ram_data_temp + 1'b1;
	else
		ram_data_temp <= 8'd0;
end

sync_ff 
#(
	8
)u_sync_ff
(
	.clk								(clk),
	.rstn								(rstn),
	.A									(ram_data_temp),
	.Y									(ram_data_temp_d)
);

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_data_error_temp <= 1'b1;
	else if(ram_data_temp_d == ram_rd_data)
		ram_data_error_temp <= 1'b0;
	else 
		ram_data_error_temp <= 1'b1;
end

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_data_error <= 1'b1;
	else if((ram_rd_en == 1'b1) && (ram_rd_cnt == 6'd31))
		ram_data_error <= ram_data_error_temp;
	else 
		ram_data_error <= ram_data_error;
end

endmodule



