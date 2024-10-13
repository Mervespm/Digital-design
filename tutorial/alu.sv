`timescale 1ns/1ps

module alu #(
    parameter N = 4
) (
    input    logic [N-1:0]  A,
    input    logic [N-1:0]  B,
    output   logic [N-1:0]  Y,
    input    logic [2:0]    opcode

);

    always_comb begin
        case (opcode)
            0: Y = A + B;
            1: Y = A - B;
            2: Y = A - 1;
            3: Y = A + 1;
            4: Y = ~A;
            5: Y = A & B;
            6: Y = A | B;
            7: Y = A ^ B;
            default: Y = 0;
        endcase
    end
    
endmodule

