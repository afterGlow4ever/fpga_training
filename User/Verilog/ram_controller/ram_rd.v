//===============================================
//
//	File: ram_rd.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is used to read for RAM.
//
//===============================================

module ram_rd
(
	input							clk,
	input							rstn,

	output						ram_rd_en,
	output reg [ 4:0]	ram_rd_addr,
	input      [ 7:0]	ram_rd_data
);

// Counter for data
reg [ 5:0]					ram_rd_cnt;

// Data valid in 0~31
assign ram_rd_en = ((ram_rd_cnt >= 6'd0) && (ram_rd_cnt <= 6'd31) && rstn) ? 1'b1 : 1'b0;

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

// RAM addr signal
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		ram_rd_addr <= 5'd0;
	else if(ram_rd_cnt >= 6'd0 && ram_rd_cnt < 6'd31)
		ram_rd_addr <= ram_rd_addr + 1'b1;
	else
		ram_rd_addr <= 5'd0;
end

endmodule



