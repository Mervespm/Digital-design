`timescale 1ns/1ps


module multiplier(
    input   logic           sel,   
    input   logic   [5:0]   a,     
    input   logic   [5:0]   b,     
    output  logic   [5:0]   r      
);
    logic   [11:0]  temp; // Temporary storage for multiplication result
    always_comb begin
        temp = a * b;
        case (sel)
            1'b0: r = temp[5:0];   // Low 6 bits
            1'b1: r = temp[11:6];  // High 6 bits
            default: r = 6'b000000; // Handle undefined cases
        endcase
    end
endmodule