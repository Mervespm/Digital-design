`timescale 1ns/1ps

module decoder(
    input       logic [2:0]     din,
    input       logic           en,
    output      logic [7:0]     dout 
);
    always_comb begin
        dout = 8'b0;  

        if (en) begin
            dout[din] = 1'b1;  
        end
    end
endmodule