//===============================================
//
//	File: led_gate_tb.v
//	Author: afterGlow,4ever
//	Date: 06032022
//	Version: v1.0
//
// 	This file is testbench for leds and keys test
// 	in fpga plaform.
//
//===============================================

`timescale 1 ns/ 1 ns

module led_tb_gate();

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

	#10000
	$display("Simulation end.\n");                       
	$stop;
// --> end                                             
end

// Key
initial
begin
	key = 4'b1111;

	#1000
	$display("Key pressed.\n");  

	// Key pressed in order
	forever
	begin
		#500
		case(key)
			4'b1111: key = 4'b1110;
			4'b1110: key = 4'b1101;
			4'b1101: key = 4'b1011;
			4'b1011: key = 4'b0111;
			4'b0111: key = 4'b1111;
			default: key = 4'b1111;
		endcase
	end
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

