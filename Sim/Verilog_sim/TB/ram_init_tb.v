//===============================================
//
//	File: ram_mif_tb.v
//	Author: afterGlow,4ever
//	Date: 05222022
//	Version: v1.0
//
// 	This file is testbench for init file for RAM
// 	in verilog plaform.
//
//===============================================

`timescale 1 ns/ 1 ns

module ram_init_tb();

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

	#1500 
	force ram_init_tb.u_top.u_ram_top.ram_enable = 1'b1;
	$display("RAM running...\n");   

	#4000 
	release ram_init_tb.u_top.u_ram_top.ram_enable;
	$display("RAM stop...\n");   

	#100
	$display("Simulation end.\n");                       
	$stop;
// --> end                                             
end

initial 
begin
	wait(ram_init_tb.u_top.u_ram_top.ram_enable == 1'b1)
	force ram_init_tb.u_top.u_ram_top.u_ram_wr.ram_wr_en = 1'b0;
	$readmemh("../TV/init_file/ram_init.txt", ram_init_tb.u_top.u_ram_top.ram_2port_tp_inst.ram);
	$display("RAM init file has been loaded...\n");   
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

