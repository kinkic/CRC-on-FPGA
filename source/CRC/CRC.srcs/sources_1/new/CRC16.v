`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:08:45
// Design Name: 
// Module Name: CRC16
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


module crc(clk,data,reset,crc);
input[7:0] data;
input clk;
input reset;
output reg [15:0]crc=0;
wire[23:0]stemp; 
reg[23:0]temp=0;
parameter polynomial=17'b1_0001_0000_0010_0001;
assign stemp={data,16'b0000000000000000};
always @ (posedge clk or negedge reset)
    begin 
          if(!reset)
              begin
               crc<=0;
               temp<=stemp; 
              end
           else 
               begin
               if(temp[23]) temp[23:7]<=temp[23:7]^polynomial;
               else if(temp[22]) temp[22:6]<=temp[22:6]^polynomial;
               else if(temp[21]) temp[21:5]<=temp[21:5]^polynomial;
               else if(temp[20]) temp[20:4]<=temp[20:4]^polynomial;
               else if(temp[19]) temp[19:3]<=temp[19:3]^polynomial;
               else if(temp[18]) temp[18:2]<=temp[18:2]^polynomial;
               else if(temp[17]) temp[17:1]<=temp[17:1]^polynomial;
               else if(temp[16]) temp[16:0]<=temp[16:0]^polynomial;
               else   crc<=temp[15:0];    
              end
     end  
endmodule

