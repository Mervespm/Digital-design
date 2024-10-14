`timescale 1ns/1ps


module shifter(
    input   logic   [1:0]   sel,   
    input   logic   [5:0]   a,     
    input   logic   [2:0]   b,     
    output  logic   [5:0]   r      
);
  logic temp;

    always_comb begin
        case (sel)
            2'b00: r = a << b;   // Logical left shift
            2'b01: r = a << b;   // Same as logical left shift
            2'b10: r = a >> b;   // Logical right shift
            2'b11: begin
                    r = a >> b;                  // Perform logical right shift
                    if (a[5]) begin              // Check if the sign bit (MSB) is 1
                        r = r | ({6{1'b1}} << b); // Fill vacated bits with sign bit (1's)
                    end else begin
                        r = r & (~({6{1'b1}} << b)); // Fill vacated bits with sign bit (0's)
                    end
                end

            default: r = 6'b000000; // Handle undefined cases
        endcase
    end
endmodule

