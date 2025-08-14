`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 12:25:00 PM
// Design Name: 
// Module Name: sequencedetect
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


module sequencedetect(
clk,reset,z,x
    );
    input clk,reset,x;
    output reg z;
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
    reg [1:0] PS,NS;
    always @(posedge clk or posedge reset) begin
    if(reset) PS<=s0;
    else PS<=NS;
    end
    always @(PS,x) begin
    case(PS)
    s0:begin
    z=x?0:0;
    NS=x?s0:s1;
    end
    s1: begin
    z=x?0:0;
    NS=x?s2:s1;
    end
    s2:begin
    z=x?0:0;
    NS=x?s3:s1;
    end
    s3: begin
    z=x?0:1;
    NS=x?s1:s0;
    end 
    endcase 
    end
endmodule
