//===============================================
//
//	File: fifo_top.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This file is used for FIFO.
//
//===============================================

module fifo_top
(
	input							clk_25m,
	input							clk_50m,
	input							rstn,
	input							key_press,

	output 						fifo_state
);

// FIFO signals for write
wire								fifo_wr_req;
wire								fifo_wr_full;
wire								fifo_wr_empty;
wire [ 7:0]					fifo_wr_data;
wire [ 4:0]					fifo_wr_usedw;

// FIFO signals for read
wire 								fifo_rd_req/*synthesis keep*/;
wire 								fifo_rd_full/*synthesis keep*/;
wire 								fifo_rd_empty/*synthesis keep*/;
wire [ 7:0]					fifo_rd_data/*synthesis keep*/;
wire [ 4:0]					fifo_rd_usedw/*synthesis keep*/;

// FIFO write or read enable signal
wire								fifo_enable;

// FIFO controller
assign fifo_enable = rstn & ~key_press;

fifo_rd u_fifo_rd
(
	.clk							(clk_50m),
	.rstn							(fifo_enable),
	.fifo_rd_full			(fifo_rd_full),
	.fifo_rd_empty		(fifo_rd_empty),
	.fifo_rd_req			(fifo_rd_req),
	.fifo_rd_data			(fifo_rd_data)
);

fifo_wr u_fifo_wr
(
	.clk							(clk_25m),
	.rstn							(fifo_enable),
	.fifo_wr_full			(fifo_wr_full),
	.fifo_wr_empty		(fifo_wr_empty),
	.fifo_wr_req			(fifo_wr_req),
	.fifo_wr_data			(fifo_wr_data)
);

`ifdef FPGA_FIFO
fifo0 fifo0_inst
(
	.wrclk						(clk_25m),
	.wrreq						(fifo_wr_req),
	.data							(fifo_wr_data),
	.wrempty					(fifo_wr_empty),
	.wrfull						(fifo_wr_full),
	.wrusedw					(fifo_wr_usedw),

	.rdclk						(clk_50m),
	.rdreq						(fifo_rd_req),
	.q								(fifo_rd_data),
	.rdempty					(fifo_rd_empty),
	.rdfull						(fifo_rd_full),
	.rdusedw					(fifo_rd_usedw)
);
`else
fifo_async
#(
		7,8
)fifo_async_inst
(
	.wr_clk						(clk_25m),
	.rd_clk						(clk_50m),
	.rstn							(fifo_enable),
	.wr_req						(fifo_wr_req),
	.rd_req						(fifo_rd_req),
	.wr_full					(fifo_wr_full),
	.rd_empty					(fifo_rd_empty),
	.data							(fifo_wr_data),
	.q								(fifo_rd_data)
);
`endif

fifo_data_check u_fifo_data_check
(
	.clk							(clk_50m),
	.rstn							(fifo_enable),

	.fifo_rd_en				(fifo_rd_req && !fifo_rd_empty),
	.fifo_rd_addr			(),
	.fifo_rd_data			(fifo_rd_data),

	.fifo_data_error	(fifo_state)
);

//assign fifo_state = 1'b0;

`ifdef FPGA_FIFO_STP
fpga_training_stp	fpga_training_stp_fifo 
(
	.acq_clk (clk_50m),
	.acq_data_in ({fifo_rd_req,fifo_rd_usedw,fifo_rd_data}),
	.acq_trigger_in ({fifo_rd_req,fifo_rd_usedw,fifo_rd_data})
);
`endif

endmodule

