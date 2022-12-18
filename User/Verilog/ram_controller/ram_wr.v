//===============================================
//
//	File: ram_wr.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is used to write for RAM.
//
//===============================================

module ram_wr
(
	input 						clk,
	input							rstn,	
										
	output						ram_wr_en,
	output reg [ 4:0]	ram_wr_addr,
	output reg [ 7:0]	ram_wr_data
);

// Counter for data
reg [ 5:0]					ram_wr_cnt;		

// Data valid in 0~31
assign ram_wr_en = ((ram_wr_cnt >= 6'd0) && (ram_wr_cnt <= 6'd31) && rstn) ? 1'b1 : 1'b0;

// RAM write counter
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_wr_cnt <= 6'd0;
	else if(ram_wr_cnt == 6'd63)
		ram_wr_cnt <= ram_wr_cnt;
	else
		ram_wr_cnt <= ram_wr_cnt + 1'b1;
end

// RAM data in 0~31
always @(posedge clk or negedge rstn)
begin 
	if(!rstn)
		ram_wr_data <= 8'd0;
	else if(ram_wr_cnt >= 6'd0 && ram_wr_cnt < 6'd31)
		ram_wr_data <= ram_wr_data + 1'b1;
	else
		ram_wr_data <= 8'd0;
end

// RAM addr signal
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_wr_addr <= 5'd0;
	else if(ram_wr_cnt >= 6'd0 && ram_wr_cnt < 6'd31)
		ram_wr_addr <= ram_wr_addr + 1'b1;
	else
		ram_wr_addr <= 5'd0;
end

endmodule

