//===============================================
//
//	File: ram_top.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is used for RAM top.
//
//===============================================

module ram_top
(
	input							clk_25m,
	input							clk_50m,
	input							rstn,
	input							key_press,

	output 						ram_state
);

// RAM signals for write
wire								ram_wr_en;
wire [ 4:0]					ram_wr_addr;
wire [ 7:0]					ram_wr_data;

// RAM signals for read
wire 								ram_rd_en/*synthesis keep*/;
wire [ 4:0]					ram_rd_addr/*synthesis keep*/;
wire [ 7:0]					ram_rd_data/*synthesis keep*/;

// RAM write or read enable signal
wire								ram_enable;

// RAM controller
assign ram_enable = rstn & ~key_press;

ram_rd u_ram_rd
(
	.clk							(clk_25m),
	.rstn							(ram_enable),

	.ram_rd_en				(ram_rd_en),
	.ram_rd_addr			(ram_rd_addr),
	.ram_rd_data			(ram_rd_data)
);

ram_wr u_ram_wr
(
	.clk							(clk_50m),
	.rstn							(ram_enable),

	.ram_wr_en				(ram_wr_en),
	.ram_wr_addr			(ram_wr_addr),
	.ram_wr_data			(ram_wr_data)
);

`ifdef FPGA_RAM
ram0_2port ram0_2port_inst
(
	.wraddress				(ram_wr_addr),
	.wrclock					(clk_50m),
	.wren							(ram_wr_en),
	.data							(ram_wr_data),
	.rdaddress				(ram_rd_addr),
	.rdclock					(clk_25m),
	.rden							(ram_rd_en),
	.q								(ram_rd_data)
);
`else
ram_2port_tp
#(
		5,8
)ram_2port_tp_inst
(
	.wr_clk						(clk_50m),
	.rd_clk						(clk_25m),
	.rstn							(rstn),
	.wren							(ram_wr_en),
	.rden							(ram_rd_en),
	.wr_addr					(ram_wr_addr),
	.rd_addr					(ram_rd_addr),
	.data							(ram_wr_data),
	.q								(ram_rd_data)
);
`endif

ram_data_check u_ram_data_check
(
	.clk							(clk_25m),
	.rstn							(ram_enable),

	.ram_rd_en				(ram_rd_en),
	.ram_rd_addr			(ram_rd_addr),
	.ram_rd_data			(ram_rd_data),

	.ram_data_error		(ram_state)
);

`ifdef FPGA_RAM_STP
fpga_training_stp	fpga_training_stp_ram 
(
	.acq_clk (clk_50m),
	.acq_data_in ({ram_rd_addr, ram_rd_data}),
	.acq_trigger_in ({ram_rd_addr, ram_rd_data})
);
`endif

endmodule

