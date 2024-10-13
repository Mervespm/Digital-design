`timescale 1ns/1ps

module register(
    input       logic [3:0]     din,
    input       logic           we,    
    input       logic           rst,  
    input       logic           clk,  
    output      logic [3:0]     dout
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            dout <= 4'b0000;  
        end
        else if (we == 1) begin
            dout <= din;      
        end
    end
    
endmodule
git remote add origin