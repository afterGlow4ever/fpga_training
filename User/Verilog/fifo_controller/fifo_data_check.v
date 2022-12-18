//===============================================
//
//	File: fifo_data_check.v
//	Author: afterGlow,4ever
//	Date: 06052022
//	Version: v1.0
//
// 	This file is used to check data for FIFO.
//
//===============================================

module fifo_data_check
(
	input									clk,
	input									rstn,

	input									fifo_rd_en,
	input [ 4:0]					fifo_rd_addr,
	input	[ 7:0]					fifo_rd_data,

	output reg						fifo_data_error
);

// Counter for data
reg  [ 5:0]							fifo_rd_cnt;

// Data check
reg  [ 7:0]					fifo_data_temp;
`ifdef FPGA_FIFO
wire [ 7:0]					fifo_data_temp_d;
`endif
reg									fifo_data_error_temp;

// Data valid in 0~31
//assign fifo_rd_en = ((fifo_rd_cnt >= 6'd0) && (fifo_rd_cnt <= 6'd31) && rstn) ? 1'b1 : 1'b0;

// Read fifo in 0~31
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_rd_cnt <= 6'd0;
	else if((fifo_rd_cnt == 6'd63) || !fifo_rd_en)
		fifo_rd_cnt <= fifo_rd_cnt;
	else
		fifo_rd_cnt <= fifo_rd_cnt + 1'b1;
end

// fifo data for check
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_data_temp <= 8'd0;
	else if((fifo_rd_cnt >= 6'd0 && fifo_rd_cnt < 6'd63) && fifo_rd_en)
		fifo_data_temp <= fifo_data_temp + 1'b1;
	else
		fifo_data_temp <= fifo_data_temp;
end

`ifdef FPGA_FIFO
sync_ff 
#(
	8
)u_sync_ff_2d
(
	.clk								(clk),
	.rstn								(rstn),
	.A									(fifo_data_temp),
	.Y									(fifo_data_temp_d)
);
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_data_error_temp <= 1'b1;
	else if(fifo_data_temp_d == fifo_rd_data)
		fifo_data_error_temp <= 1'b0;
	else 
		fifo_data_error_temp <= 1'b1;
end
`else
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_data_error_temp <= 1'b1;
	else if(fifo_data_temp == fifo_rd_data)
		fifo_data_error_temp <= 1'b0;
	else 
		fifo_data_error_temp <= 1'b1;
end
`endif

always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_data_error <= 1'b1;
	else if((fifo_rd_en == 1'b1) && (fifo_rd_cnt == 6'd63))
		fifo_data_error <= fifo_data_error_temp;
	else 
		fifo_data_error <= fifo_data_error;
end

endmodule



