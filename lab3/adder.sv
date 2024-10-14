`timescale 1ns/1ps


module adder(
    input   logic   [1:0]   sel,   
    input   logic   [5:0]   a,     
    input   logic   [5:0]   b,     
    output  logic   [5:0]   r      
);
    logic   [6:0]  temp; // 7 bits to hold carry/borrow

    always_comb begin
        temp = 7'b0000000; // Initialize temp
        case (sel)
            2'b00: begin
                temp = a + b; 
                r = temp[5:0];  // Low 6 bits
            end
            2'b01: begin
                temp = a + b; 
                r = {5'b00000, temp[6]};  // Output the carry (highest bit)
            end
            2'b10: begin // a - b
                temp = a + (~b + 1); // Perform a + (-b)
                r = temp[5:0];  // Low 6 bits of a - b
            end
            2'b11: begin // borrow
                temp = a - b; 
                r = {5'b00000, (temp[6] ? 1'b1 : 1'b0)};  // Output the borrow (highest bit)
            end
            default: r = 6'b000000;  // Handle undefined cases
        endcase
    end
endmodule