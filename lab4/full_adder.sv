`timescale 1ns/1ps

module full_adder(
    input       logic   a,
    input       logic   b,
    input       logic   cin,
    output      logic   cout, 
    output      logic   sum
);
    always_comb begin
        sum = a ^ b ^ cin; 
        cout = (a ^ b)  ? cin  : b;           
        cout = (a & b) | (cin & (a ^ b)); 
    end
endmodule
