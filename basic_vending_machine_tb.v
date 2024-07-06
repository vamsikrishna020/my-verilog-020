module vending_machine_tb;
reg clk;
reg[1:0] in;reg rst;
wire out;wire[1:0] change;
vending_machine uut(clk,rst,in,out,change);
initial begin
  $monitor ("change = %d,out = %d",change,out);
rst = 1;
clk = 0;
#6 rst = 0;
  in = 2;
#16 in = 2;
#20 $finish;
end
always #5 clk = ~clk;
endmodule