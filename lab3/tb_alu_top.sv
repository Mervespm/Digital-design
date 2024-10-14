`timescale 1ns/1ps

module alu_tb;

    // Parameters
    parameter WAIT_TIME = 10ns;

    // Testbench signals
    logic [3:0] sel;
    logic [5:0] a;
    logic [5:0] b;
    logic [5:0] r;

    // Instantiate the Device Under Test (DUT)
    alu_top dut (
        .sel (sel),
        .a   (a),
        .b   (b),
        .r   (r)
    );

    // Test procedure
    initial begin
        $display("Time\tSel\tA\t\tB\t\tR");   // Print header for the monitor
        $monitor("t\t%0b\t%0b\t%0b\t%0b", sel, a, b, r);

        // Initialize inputs
        a = 6'b000100;   // Set a = 4
        b = 6'b000010;   // Set b = 2

        // Test different sel values
        for (int i = 0; i < 16; i++) begin
            sel = i[3:0];  // Apply the 4-bit select signal
            #WAIT_TIME;    // Wait for each operation to be performed
        end
      
      // Second test case: Change a and b
        a = 6'b110001;   // Set a = 49
        b = 6'b110010;   // Set b = 50
        for (int i = 0; i < 16; i++) begin
            sel = i[3:0];
            #WAIT_TIME;
        end

        // Third test case: a = 63, b = 63
        a = 6'b111111;
        b = 6'b111111;
        for (int i = 0; i < 16; i++) begin
            sel = i[3:0];
            #WAIT_TIME;
        end


        // End simulation
        $finish;
    end

endmodule