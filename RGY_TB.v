module RGY_TB;

    reg clk;
    reg reset;
    wire green;
    wire yellow;
    wire red;

    
    RGY uut (
        .clk(clk),
        .reset(reset),
        .green(green),
        .yellow(yellow),
        .red(red)
    );

    // Clock generation (5-second period)
    always begin
        #2.5 clk = ~clk;  
    end

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Run simulation for a few cycles
        #1000;

        // Finish simulation
        $finish;
    end

endmodule
