//===============================================
//
//	File: pll_loss_tb.v
//	Author: afterGlow,4ever
//	Date: 05132022
//	Version: v1.0
//
// 	This file is testbench for Altera PLL ip core
// 	losing lock test in fpga plaform.
//
//===============================================

`timescale 1 ns/ 1 ns

module pll_loss_tb();

// test vector input registers
reg [3:0] key;
reg sys_clk;
reg sys_rstn;

// wires                                               
wire [3:0]  led;

// Clock
always #10 sys_clk =~ sys_clk; 

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
	$display("Running testbench");                       
	sys_clk = 1'b0;
	sys_rstn = 1'b0;
	$display("Simulation start...\n");

	#100 
	sys_rstn = 1'b1;
	$display("sys_rstn = 1\n");   

	#500 
	force pll_loss_tb.u_top.u_clock_tree.pll0_locked = 1'b0;
	$display("PLL loss...\n"); 

	#500 
	release pll_loss_tb.u_top.u_clock_tree.pll0_locked;
	$display("PLL recover...\n"); 

	#1000
	$display("Simulation end.\n");                       
	$stop;
// --> end                                             
end

//always                                                 
//// optional sensitivity list                           
//// @(event1 or event2 or .... eventn)                  
//begin                                                  
//// code executes for every event on sensitivity list   
//// insert code here --> begin                          
//                                                       
//// --> end                                             
//end

// assign statements (if any)                          
top u_top 
(
// port map - connection between master ports and signals/registers   
	.key(key),
	.led(led),
	.sys_clk(sys_clk),
	.sys_rstn(sys_rstn)
);

endmodule

