module RGY(
    input clk,            // 5-second clock signal
    input reset,          // Asynchronous reset
    output reg green,     // Green light output
    output reg yellow,    // Yellow light output
    output reg red        // Red light output
);

    // State encoding
    parameter gt = 15;  // 75 seconds (15 cycles of 5 seconds each)
    parameter yt = 1;  // 5 seconds (1 cycle of 5 seconds)
    parameter rt = 17;    // 85 seconds (17 cycles of 5 seconds each)
    parameter tt = gt + yt + rt;  // Total cycles in one complete cycle

    reg [5:0] count;  // 6-bit counter

    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 6'b000000;  // Reset counter to 0
        end else begin
          if (count == tt - 1) begin
                count <= 6'b000000;  // Reset counter after one complete cycle
            end else begin
                count <= count + 1;
            end
        end
    end

    // Output logic
    always @(*) begin
        // Default to all lights off
        green = 1'b0;
        yellow = 1'b0;
        red = 1'b0;

      if (count < gt) begin
            green = 1'b1;  // Green light on for first GREEN_TIME cycles
      end else if (count < gt+yt) begin
            yellow = 1'b1;  // Yellow light on for YELLOW_TIME cycles after green
        end else begin
            red = 1'b1;  // Red light on for RED_TIME cycles after yellow
        end
    end

endmodule
