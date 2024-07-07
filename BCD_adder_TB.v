module BCD_adder_tb ;

reg [7:0] a,b;
  wire [7:0] sum;
wire carry ;

  BCD_adder u0(.a(a),.b(b),.sum(sum),.carry(carry));

initial
begin

  $monitor("a=%b b=%b carry=%b out=%d%d",a,b,carry,sum[7:4],sum[3:0]);

a=8'b01010111;
b=8'b00100110;
#5;
a=8'b00001000;
b=8'b00001001;
 #5;
 a = 8'b01010101;
 b = 8'b01010000;
end

endmodule
