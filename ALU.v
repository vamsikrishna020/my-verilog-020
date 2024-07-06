module ALU(f,a,b,op,en);
  input [2:0] op; input [7:0] a,b; input en;
  output [7:0] f; reg [7:0] alu;
  assign f = (en == 1) ? alu:8'bz;
  always @(*)begin 
    case(op)
       3'b000 :  alu = a+b;
       3'b001 :  alu = a-b;
       3'b010 :  alu = b >> 2;
       3'b011 :  alu = a/b;
       3'b100 :  alu = ~a;
      default :  alu = '0;
    endcase
  end
endmodule
      