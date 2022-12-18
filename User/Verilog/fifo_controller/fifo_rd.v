//===============================================
//
//	File: fifo_rd.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This file is used to read for FIFO.
//
//===============================================

module fifo_rd
(
	input							clk,
	input							rstn,

	input							fifo_rd_full,
	input							fifo_rd_empty,
	output 		 				fifo_rd_req,
	input      [ 7:0]	fifo_rd_data
);

// Counter for data
reg [ 7:0]					fifo_rd_cnt;

// Data valid when fifo not empty
assign fifo_rd_req = !fifo_rd_empty ? (rstn ? 1'b1 : 1'b0) : 1'b0;

// Read fifo when fifo not empty
always @(posedge clk or negedge rstn)
begin
	if(!rstn)
		fifo_rd_cnt <= 8'd0;
	else if(fifo_rd_empty == 1)
		fifo_rd_cnt <= fifo_rd_cnt;
	else
		fifo_rd_cnt <= fifo_rd_cnt + 1'b1;
end

//// Counter for data
//reg [ 1:0]					fifo_rd_flow;
//// Read fifo
//always @(posedge clk or negedge rstn)
//begin
//	if(!rstn)
//	begin
//		fifo_rd_req <= 1'b0;
//		fifo_rd_flow <= 2'b0;
//	end
//	else
//	begin
//		case(fifo_rd_flow)
//			2'd0:
//			begin
//				if(fifo_rd_full)
//				begin
//					fifo_rd_req <= 1'b1;
//					fifo_rd_flow <= fifo_rd_flow + 1'b1;
//				end
//				else
//					fifo_rd_flow <= fifo_rd_flow;
//			end
//			2'd1:
//			begin
//				if(fifo_rd_empty)
//				begin
//					fifo_rd_req <= 1'b0;
//					fifo_rd_flow <= 2'b0;
//				end
//				else
//					fifo_rd_req <= 1'b1;
//			end
//		endcase
//	end
//end

endmodule
						
