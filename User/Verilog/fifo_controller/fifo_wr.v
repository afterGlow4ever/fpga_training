//===============================================
//
//	File: fifo_wr.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This file is used to write for FIFO.
//
//===============================================

module fifo_wr
(
	input 						clk,
	input							rstn,	
						
	input							fifo_wr_empty,
	input							fifo_wr_full,
	output 						fifo_wr_req,
	output reg [ 7:0]	fifo_wr_data
);

// Counter for data
reg [ 7:0]					fifo_wr_cnt;		

// Data valid when fifo not full
assign fifo_wr_req = !fifo_wr_full ? (((fifo_wr_cnt >= 8'd0) && (fifo_wr_cnt <= 8'd63) && rstn) ? 1'b1 : 1'b0) : 1'b0;

// Write fifo when fifo not full
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_wr_cnt <= 8'd0;
	else if((fifo_wr_cnt == 8'd64) || (fifo_wr_full == 1))
		fifo_wr_cnt <= fifo_wr_cnt;
	else 
		fifo_wr_cnt <= fifo_wr_cnt + 1'b1;
end

// Write data to fifo
always @(posedge clk or negedge rstn)
begin 
	if(!rstn)
		fifo_wr_data <= 8'd0;
	else if((fifo_wr_cnt >= 8'd63) || (fifo_wr_full == 1))
		fifo_wr_data <= 8'd0;
	else
		fifo_wr_data <= fifo_wr_data + 1'b1;
end

//// Counter for data
//reg [ 1:0]					fifo_wr_flow;		
//// FIFO write 
//always @(posedge clk or negedge rstn)
//begin
//	if(!rstn)
//	begin
//		fifo_wr_req <= 1'b0;
//		fifo_wr_data <= 8'b0;
//		fifo_wr_flow <= 2'd0;
//	end
//	else
//	begin
//		case(fifo_wr_flow)
//			2'd0:
//			begin
//				if(fifo_wr_empty)
//				begin
//					fifo_wr_req <= 1'b1;
//					fifo_wr_data <= 8'b0;
//					fifo_wr_flow <= fifo_wr_flow + 1'b1;
//				end
//				else
//					fifo_wr_flow <= fifo_wr_flow;
//			end					
//			2'd1:
//			begin
//				if(fifo_wr_full)
//				begin
//					fifo_wr_req <= 1'b0;
//					fifo_wr_data <= 8'b0;
//					fifo_wr_flow <= 2'b0;
//				end
//				else
//				begin
//					fifo_wr_req <= 1'b1;
//					fifo_wr_data <= fifo_wr_data + 1'b1;
//				end
//			end
//			default:
//					fifo_wr_flow <= 2'b0;
//		endcase
//	end
//end

endmodule		
		
