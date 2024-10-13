`timescale 1ns/1ps

module multiplier #(
    parameter N = 4
) (
    input   logic [N-1:0]    a, 
    input   logic [N-1:0]    b, 
    output  logic [2*N-1:0]  c
);
    logic [2*N-1:0] temp; 

    always_comb begin
      
        c = 0;
        
        for (int i=0; i<N; ++i) begin
            temp = a << i;  
            if (b[i] == 1) begin
                c = c + temp; 
            end
        end
    end
    
endmodule
