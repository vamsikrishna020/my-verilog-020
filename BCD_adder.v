
module BCD_adder(
  input [7:0] a,    // 8-bit BCD input A
  input [7:0] b,    // 8-bit BCD input B
  output [7:0] sum, // 8-bit BCD sum
  output carry   // Carry-out for sum > 99
);

    wire [4:0] sum1, sum2; // Intermediate sum including carry for each digit
    wire [3:0] digit1,digit2; // Adjusted sum for BCD correction
    wire carry1, carry2; // Carry for each digit addition

    // First digit (ones place) addition
    assign sum1 = a[3:0] + b[3:0];
  assign carry1 = (sum1 > 4'd9); // Check if sum exceeds 9
  assign digit1 = (carry1) ? (sum1 + 4'd6) : sum1;

    // Second digit (tens place) addition
    assign sum2 = a[7:4] + b[7:4] + carry1;
  assign carry2 = (sum2 > 4'd9); // Check if sum exceeds 9
  assign digit2 = (carry2)? (sum2 + 4'd6) : sum2;

    // Combine the adjusted digits to form the final BCD sum
    assign sum = {digit2[3:0], digit1[3:0]};
    assign carry = carry2;

endmodule



		
