module mod_16_counter (
	input wire clk,
	input wire reset,
	input wire en,
	output reg [4:0] counter_out
);

always @(posedge clk)
begin
	if(reset==1'b1)
		counter_out <= 4'b0000;
	
	else if (en==1'b1)
		counter_out<= counter_out+1;
	
end
endmodule