`timescale 1ns/1ps

module tb_multiplier;

    parameter N = 4;

    // Inputs
    logic [N-1:0] a;
    logic [N-1:0] b;

    // Output
    logic [2*N-1:0] c;

    // Instantiate the multiplier module
    multiplier #(
        .N(N)
    ) multiplier_inst (
        .a(a),
        .b(b),
        .c(c)
    );

    // Test sequence
    initial begin
        // Dump waveform
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_multiplier);

        // Test 1: Multiply 3 * 2
        a = 4'b0011;  // 3 in binary
        b = 4'b0010;  // 2 in binary
        #10;          // Wait 10 time units to observe output

        // Test 2: Multiply 7 * 5
        a = 4'b0111;  // 7 in binary
        b = 4'b0101;  // 5 in binary
        #10;          // Wait 10 time units to observe output

        // Test 3: Multiply 15 * 15
        a = 4'b1111;  // 15 in binary
        b = 4'b1111;  // 15 in binary
        #10;          // Wait 10 time units to observe output

        // Test 4: Multiply 8 * 4
        a = 4'b1000;  // 8 in binary
        b = 4'b0100;  // 4 in binary
        #10;          // Wait 10 time units to observe output

        // End simulation
        $finish;
    end

endmodule
