`timescale 1ns/1ps

module mult(
    input   logic   [7:0]   a,
    input   logic   [7:0]   b,
    input   logic           clk,
    output  logic   [15:0]  p
);
   
logic [7:0] a_reg;        
logic [7:0] b_reg;        
logic [15:0] p;           

carry_save_multiplier #(.N(8)) multiplier (
    .a(a_reg),   
    .b(b_reg),   
    .p(p)        
);


always_ff @(posedge clk) begin
    a_reg <= a;      
    b_reg <= b;     
    
end

always_ff @(posedge clk ) begin

    r <= p;          
    
end
endmodule