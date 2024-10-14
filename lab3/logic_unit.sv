`timescale 1ns/1ps


module logic_unit(
    input   logic   [1:0]   sel,   
    input   logic   [5:0]   a,     
    input   logic   [5:0]   b,     
    output  logic   [5:0]   r      
);

    always_comb begin
        case (sel)
            2'b00: r = ~a;     // Bitwise NOT
            2'b01: r = a & b;  // Bitwise AND
            2'b10: r = a | b;  // Bitwise OR
            2'b11: r = a ^ b;  // Bitwise XOR
            default: r = 6'b000000; // Handle undefined cases
        endcase
    end
    
endmodule