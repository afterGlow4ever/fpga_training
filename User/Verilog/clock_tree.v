module clock_tree
(
	input							sys_clk,
	input							sys_rstn,

	output						clk_50m,
	output						clk_25m,
	output reg				pll_locked
);

// PLL locked signal
wire								pll0_locked;
wire								pll1_locked;
reg [3:0]						pll_locked_cnt;
reg									pll_locked_d;

// PLL rstn signal
wire								pll_rstn;
wire								pll_rstn_flag;

// PLL locked logic
// PLL should reset after PLL unlocked.
always @(posedge sys_clk or negedge sys_rstn)
begin
	if(!sys_rstn)
		pll_locked_cnt <= 4'd10;
	else if(pll0_locked && pll1_locked)
		if(pll_locked_cnt > 4'd0)
			pll_locked_cnt <= pll_locked_cnt - 1'b1;
		else
			pll_locked_cnt <= pll_locked_cnt;
	else
		pll_locked_cnt <= 4'd10;
end

always @(posedge sys_clk or negedge sys_rstn)
begin
	if(!sys_rstn)
		pll_locked <= 1'b0;
	else if(pll_locked_cnt == 1'b0)
		pll_locked <= 1'b1;
	else
		pll_locked <= 1'b0;
end

always @(posedge sys_clk or negedge sys_rstn)
begin
	if(!sys_rstn)
		pll_locked_d <= 1'b0;
	else
		pll_locked_d <= pll_locked;
end

// PLL rstn logic
assign pll_rstn_flag = ((pll_locked == 1'b0) & (pll_locked_d == 1'b1)) ? 1'b0 : 1'b1;
assign pll_rstn = sys_rstn & pll_rstn_flag;

`ifdef FPGA_PLL
// PLL ipcore
pll0 pll0_inst
(
	.areset						(~pll_rstn),
	.inclk0						(sys_clk),
	.c0								(clk_50m),
	.locked						(pll0_locked)
);

pll1 pll1_inst
(
	.areset						(~pll_rstn),
	.inclk0						(sys_clk),
	.c0								(clk_25m),
	.locked						(pll1_locked)
);
`else
// Clock rtl logic
clk_shift clk_shift_inst
(
	.inclk						(sys_clk),
	.rstn							(pll_rstn),
	.outclkn					(clk_50m),
	.locked						(pll0_locked)
);

clk_even_division 
#(
	2
)clk_even_division_inst
(
	.inclk						(sys_clk),
	.rstn							(pll_rstn),
	.outclk						(),
	.outclkn					(clk_25m),
	.locked						(pll1_locked)
);

`endif

endmodule


