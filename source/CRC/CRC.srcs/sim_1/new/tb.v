`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 20:16:14
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench;
reg clk;
reg [7:0] data;
reg reset;
wire [15:0] crc;

crc test(
.clk(clk), 
.data(data), 
.reset(reset), 
.crc(crc)
);

initial begin
clk=0;
data=0;
reset=0;

#100
reset = 1;
data =8'b11111111;

#50
reset=0;
#50
reset=1;

end
always #50 clk=~clk;
endmodule

