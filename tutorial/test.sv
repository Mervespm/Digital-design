module d_ff #(
    parameter INPUT_WIDTH,
    
) (
    input clk,
    input reset,
    input d,
    
);
    reg qReg;
    
    always @(pesedge clk) begin
        if(reset )
            qReg <= 0;
        else
            qReq <= d;

    end
    assign q = qReq;
    
endmodule