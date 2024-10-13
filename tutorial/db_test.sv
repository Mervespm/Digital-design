
module d_ff_tb;

  reg clk = 1;
  reg reset;
  reg d;
  wire q;

  d_ff  d_ff_inst (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

always #5  clk = ! clk ;
initial begin
    reset <= 1;
    d <= 0;

end

endmodule