`timescale 1ns/1ps

module name carry_save_multiplier #(
    parameter N = 8
) (
    input       logic   [N-1:0]     a,
    input       logic   [N-1:0]     b,
    output      logic   [2*N-1:0]   p
);

logic   [N-1:0] ab              [N-1:0];
logic   [N-2:0] FA_a            [N-1:0];
logic   [N-2:0] FA_b            [N-1:0];
logic   [N-2:0] FA_cin          [N-1:0];
logic   [N-2:0] FA_sum          [N-1:0];
logic   [N-2:0] FA_cout         [N-1:0];

always_comb begin
    for (int i=0; i<N; ++i) begin
        for (int j=0; j<N; ++j) begin
            ab[i][j] = a[i] & b[j]; 
        end
        
    end
    
end

// Full adders for row 0
always_comb begin
    for (int j = 1; j < N; j++) begin
        FA_a[0][j-1] = ab[0][j];  // ab(0)(n-1 downto 1)
    end
    for (int j = 0; j < N; j++) begin
        FA_b[0][j] = ab[1][j];  // ab(1)(n-1 downto 0)
    end
    for (int j = 0; j < N-1; j++) begin
        FA_cin[0][j] = ab[2][j];  // ab(2)(n-2 downto 0)
    end
    FA_cin[0][N-1] = 0;  // Append '0'
end

// Full adders for intermediate rows (1 to n-3)
always_comb begin
    for (int i = 1; i < N-2; i++) begin
        FA_a[i][N-1] = ab[i+1][N-1];  // ab(i+1)(n-1)
        for (int j = 1; j < N; j++) begin
            FA_a[i][j-1] = FA_sum[i-1][j];  // FA sum(i-1)(n-1 downto 1)
        end
        for (int j = 0; j < N; j++) begin
            FA_b[i][j] = FA_cout[i-1][j];  // FA cout(i-1)(n-1 downto 0)
        end
        for (int j = 0; j < N-1; j++) begin
            FA_cin[i][j] = ab[i+2][j];  // ab(i+2)(n-2 downto 0)
        end
        FA_cin[i][N-1] = 0;  // Append '0'
    end
end

// Full adders for the last row (row n-2)
always_comb begin
    FA_a[N-2][N-1] = ab[N-1][N-1];  // ab(n-1)(n-1)
    for (int j = 1; j < N; j++) begin
        FA_a[N-2][j-1] = FA_sum[N-3][j];  // FA sum(n-3)(n-1 downto 1)
    end
    for (int j = 0; j < N; j++) begin
        FA_b[N-2][j] = FA_cout[N-3][j];  // FA cout(n-3)(n-1 downto 0)
    end
    for (int j = 0; j < N-1; j++) begin
        FA_cin[N-2][j] = FA_cout[N-2][j];  // FA cout(n-2)(n-2 downto 0)
    end
    FA_cin[N-2][N-1] = 0;  // Append '0'
end

always_comb begin
    // Bit 0 is wired to ab(0)(0)
    p[0] = ab[0][0];

    // Bits 1 to n-2 are wired to the sum in the first FA in each row except the final row
    for (int i = 0; i < N-2; i++) begin
        p[i+1] = FA_sum[i][0];  // Sum in the first FA of each row (excluding the last row)
    end

    // Bits n-1 to 2n-2 are wired to the sum in the last row of FAs
    for (int i = 0; i < N; i++) begin
        p[N+i-1] = FA_sum[N-2][i];  // Sum in the last row
    end

    // Bit 2n-1 is wired to the cout of the last FA in the last row
    p[2*N-1] = FA_cout[N-2][N-1];  // Carry-out of the last FA in the last row
end


endmodule
