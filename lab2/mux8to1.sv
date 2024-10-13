`timescale 1ns/1ps
module mux8to1(
    input       logic [2:0]     addr,
    input       logic [3:0]     din0,
    input       logic [3:0]     din1,
    input       logic [3:0]     din2,
    input       logic [3:0]     din3,
    input       logic [3:0]     din4,
    input       logic [3:0]     din5,
    input       logic [3:0]     din6,
    input       logic [3:0]     din7,
    output      logic [3:0]     dout
);
    always_comb begin
        case (addr)
            3'b000: dout = din0;
            3'b001: dout = din1;
            3'b010: dout = din2;
            3'b011: dout = din3;
            3'b100: dout = din4;
            3'b101: dout = din5;
            3'b110: dout = din6;
            3'b111: dout = din7;             
            default: dout = 4'b0000; 
        endcase
    end
    
endmodule