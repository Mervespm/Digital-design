`timescale 1ns/1ps

module tb_shifter();

    logic           [2:0] sel;
    logic signed    [7:0] din;
    logic           [2:0] shift_count;
    logic signed    [7:0] dout;


    shifter dut (
        .sel         (sel        ),
        .din         (din        ),
        .shift_count (shift_count),
        .dout        (dout       )
    );


    logic [7:0] result_vector [0:7] = {
        8'b10011101,
        8'b01110100,
        8'b01110100,
        8'b00100111,
        8'b11100111,
        8'b01110110,
        8'b01100111,
        8'b10011101
    };

    initial begin
        din = 8'b10011101; 
        shift_count = 2;    


        for (int i = 0; i < 8; ++i) begin
            sel = i;        
            #5;             
            assert (dout == result_vector[i])
                else $error("Assertion failed at sel = %0d! Expected: %b, Got: %b", i, result_vector[i], dout);
        end
    end

endmodule
