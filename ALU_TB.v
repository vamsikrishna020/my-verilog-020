module test;
  reg [7:0] a,b; reg [2:0] op;reg en;
  wire [7:0] f;
  ALU uut(f,a,b,op,en);
  integer i;
  
  initial 
    begin
      $monitor("enable = %b,operation = %b,output = %d",en,op,f);
a = 10; b = 5; op = 0; en = 1;

for(i = 1; i < 8; i = i+ 1)begin
    #10
    op = i;
end

#10
$finish();
 
  end
endmodule
