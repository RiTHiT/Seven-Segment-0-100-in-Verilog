`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:59 07/04/2016 
// Design Name: 
// Module Name:    seven_segment 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seven_segment(anode , cathode,clk,reset);

input clk,reset;
output reg [6:0]cathode;
output [3:0]anode;
reg clk1,clk3;


reg [3:0] p = 4'b0111;
reg [6:0] y1,y2;

assign anode=p;

integer counter_1,counter_3;


always @(posedge clk,posedge reset)
begin
if(reset)
begin
counter_3<=0;
counter_1<=0;
 clk3<=0;
 clk1<=0;
 end 
 else 
 begin
 counter_1<=counter_1+1;
 counter_3<=counter_3+1;
  if(counter_1==25000000)
 begin
 counter_1<=0;
 clk1<=~clk1;
 end
 if(counter_3==100000)
 begin
 counter_3<=0;
 clk3<=~clk3;
 end
 end
 end
    
	 
	 integer count1,count2;
	 
	 always@(posedge clk1,posedge reset)
	 begin
	 if(reset)
     begin 
count1<=0;
count2<=0;
   end
else if (count1==9)
begin
count1<=0;
count2<=count2+1;
if (count2==9)
count2<=0;
end
else 
count1<=count1+1;
end


always @(count2)
begin 
case(count2)  //synthesis full_case
0:y1<=7'b0000001;
1:y1<=7'b1001111;
2:y1<=7'b0010010;
3:y1<=7'b0000110;
4:y1<=7'b1001100;
5:y1<=7'b0100100;
6:y1<=7'b0100000;
7:y1<=7'b0001111;
8:y1<=7'b0000000;
9:y1<=7'b0000100;
endcase
end

always@(count1)
begin 
case(count1) //synthesis full_case
0:y2<=7'b0000001;
1:y2<=7'b1001111;
2:y2<=7'b0010010;
3:y2<=7'b0000110;
4:y2<=7'b1001100;
5:y2<=7'b0100100;
6:y2<=7'b0100000;
7:y2<=7'b0001111;
8:y2<=7'b0000000;
9:y2<=7'b0000100;
endcase
end

always @(posedge clk3)
begin
case(anode)   //synthesis full_case
4'b0111:begin cathode<=y1;p<=4'b1011;end
4'b1011:begin cathode<=y2;p<=4'b0111;end
endcase
end
	

endmodule
