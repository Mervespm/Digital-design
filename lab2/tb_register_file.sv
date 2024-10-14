`timescale 1ns/1ps

module tb_register_file;

    // Testbench signals
    logic [2:0] addr;       // Address input
    logic we;               // Write enable
    logic rst;              // Reset
    logic clk;              // Clock
    logic [3:0] din;        // Data input
    logic [3:0] dout;       // Data output

    // Instantiate the register file
    register_file uut (
        .addr(addr),
        .we(we),
        .rst(rst),
        .clk(clk),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        addr = 3'b000;  // Register address
        we = 0;         // Write enable
        rst = 1;        // Activate reset
        din = 4'b0000;  // Data input

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;

        // Test writing to register 0
        addr = 3'b000;
        din = 4'b1010; // Data to write
        we = 1;        // Enable write
        #10;          // Wait for a clock cycle

        // Disable write
        we = 0;
        #10;          // Wait for a clock cycle

        // Read from register 0
        addr = 3'b000; // Select register 0
        #10;          // Wait for a clock cycle
        $display("Read from register %b: %b", addr, dout); // Should output 1010

        // Test writing to register 1
        addr = 3'b001;
        din = 4'b1100; // Data to write
        we = 1;        // Enable write
        #10;          // Wait for a clock cycle

        // Disable write
        we = 0;
        #10;          // Wait for a clock cycle

        // Read from register 1
        addr = 3'b001; // Select register 1
        #10;          // Wait for a clock cycle
        $display("Read from register %b: %b", addr, dout); // Should output 1100

        // Test writing to register 2
        addr = 3'b010;
        din = 4'b1111; // Data to write
        we = 1;        // Enable write
        #10;          // Wait for a clock cycle

        // Disable write
        we = 0;
        #10;          // Wait for a clock cycle

        // Read from register 2
        addr = 3'b010; // Select register 2
        #10;          // Wait for a clock cycle
        $display("Read from register %b: %b", addr, dout); // Should output 1111

        // Reset the register file
        rst = 1;
        #10;          // Wait for a clock cycle
        rst = 0;

        // Check that all registers are reset (should be 0000)
        for (int i = 0; i < 8; i++) begin
            addr = i[2:0]; // Set address to i
            #10;          // Wait for a clock cycle
            $display("After reset, read from register %b: %b", addr, dout); // Should output 0000
        end

        // End simulation
        $finish;
    end

endmodule
