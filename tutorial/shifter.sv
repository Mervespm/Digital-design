`timescale 1ns/1ps

module shifter(
    input   logic           [2:0] sel,
    input   logic signed    [7:0] din,
    input   logic           [2:0] shift_count,
    output  logic signed    [7:0] dout
);
    logic [15:0] temp;

    always_comb begin
        case(sel)
            3'b000: dout = din;
            3'b001: dout = din << shift_count;
            3'b010: dout = din <<< shift_count;
            3'b011: dout = din >> shift_count;
            3'b100: dout = din >>> shift_count;
            3'b101: 
            begin 
                temp = {din, din} << shift_count;
                dout = temp[15:8];
            end
            3'b110:
            begin 
                temp = {din, din} >> shift_count;
                dout = temp[7:0];
            end
                
            3'b111: dout = din;
              
        endcase
    end
endmodule