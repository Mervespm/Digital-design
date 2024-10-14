
`timescale 1ns/1ps

module alu_top(
    input   logic   [3:0]   sel,   
    input   logic   [5:0]   a,     
    input   logic   [5:0]   b,     
    output  logic   [5:0]   r      
);
    logic   [5:0]  mux_in [3:0]; // Intermediate results

    // Instantiate the adder module
    adder adder_inst(
        .sel    (sel[1:0]),   
        .a      (a),     
        .b      (b),     
        .r      (mux_in[0])
    );

    // Instantiate the multiplier module
    multiplier multiplier_inst(
        .sel    (sel[0]),   
        .a      (a),     
        .b      (b),     
        .r      (mux_in[1])
    );

    // Instantiate the logic unit
    logic_unit logic_unit_inst(
        .sel    (sel[1:0]),   
        .a      (a),     
        .b      (b),     
        .r      (mux_in[2])
    );

    // Instantiate the shifter module
    shifter shifter_inst(
        .sel    (sel[1:0]),   
        .a      (a),     
        .b      (b[2:0]),     
        .r      (mux_in[3])
    );

    // Multiplexer to select output
    always_comb begin
        r = mux_in[sel[3:2]]; // Select from mux_in based on upper 2 bits of sel
    end
endmodule
