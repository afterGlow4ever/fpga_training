//===============================================
//
//	File: fifo_tb.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This file is testbench for Altera FIFO ip core
// 	in fpga plaform.
//
//===============================================

`timescale 1 ns/ 1 ns

module ram_tb();

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
	force ram_tb.u_top.u_ram_top.ram_enable = 1'b1;
	$display("RAM running...\n");   

	#2000 
	release ram_tb.u_top.u_ram_top.ram_enable;
	$display("RAM stop...\n");   

	#200 
	force ram_tb.u_top.u_ram_top.ram_enable = 1'b1;
	$display("RAM running...\n");   

	#2000 
	release ram_tb.u_top.u_ram_top.ram_enable;
	$display("RAM stop...\n");   

	#100
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



`timescale 1 ns/ 1 ns

module fifo_tb();

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
	force fifo_tb.u_top.u_fifo_top.fifo_enable = 1'b1;
	$display("FIFO running...\n");   

	#2000 
	release fifo_tb.u_top.u_fifo_top.fifo_enable;
	$display("FIFO stop...\n");   

	#200 
	force fifo_tb.u_top.u_fifo_top.fifo_enable = 1'b1;
	$display("FIFO running...\n");     

	#2000 
	release fifo_tb.u_top.u_fifo_top.fifo_enable;
	$display("FIFO stop...\n");   

	#100
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

