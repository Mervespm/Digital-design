`timescale 1ns/1ps

module register_file(
    input       logic [2:0]     addr,
    input       logic           we,
    input       logic           rst,
    input       logic           clk,
    input       logic [3:0]     din,
    output      logic [3:0]     dout
);
    logic [7:0] reg_en;  
    logic [3:0] mux_in [0:7]; 
    genvar i;


    decoder decoder_inst(
        .din   (addr),
        .en    (we),
        .dout  (reg_en) 
    );


    generate
        for (i = 0; i < 8; i++) begin : reg_gen
            register reg_inst(
                .din(din),
                .we(reg_en[i]), 
                .rst(rst),
                .clk(clk),
                .dout(mux_in[i])
            );
        end
    endgenerate

    mux8to1 mux8to1_inst(
        .addr   (addr),
        .din0   (mux_in[0]),
        .din1   (mux_in[1]),  
        .din2   (mux_in[2]),
        .din3   (mux_in[3]),
        .din4   (mux_in[4]),
        .din5   (mux_in[5]),
        .din6   (mux_in[6]),
        .din7   (mux_in[7]),
        .dout  (dout)
    );

endmodule