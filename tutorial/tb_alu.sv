`timescale 1ns/1ps

module tb_alu #(
    parameter N = 8
) ();

    logic [N-1:0]  A;
    logic [N-1:0]  B;
    logic [N-1:0]  Y;
    logic [2:0]    opcode;

    alu #(
    .N(N)
    ) alu_dut(
        .A      (A     ),
        .B      (B     ),
        .Y      (Y     ),
        .opcode (opcode)
    );

    initial begin
        #10
        A = 73;
        B= 42;

        for (int i=0; i<N; i++) begin
            opcode = i;          
        end
    end

    
endmodule