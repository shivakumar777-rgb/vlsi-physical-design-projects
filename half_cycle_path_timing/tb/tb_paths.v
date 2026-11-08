// Functional check: both versions must compute a*b + c.
`timescale 1ns/1ps
module tb_paths;
    reg clk = 0, rst_n = 0;
    reg [15:0] a, b; reg [31:0] c;
    wire [31:0] y_half, y_full;
    integer i, errors = 0;
    reg [31:0] exp;

    half_cycle_path u_half (.clk(clk), .rst_n(rst_n), .a(a), .b(b), .c(c), .y(y_half));
    full_cycle_path u_full (.clk(clk), .rst_n(rst_n), .a(a), .b(b), .c(c), .y(y_full));

    always #5 clk = ~clk;   // 10 ns period

    initial begin
        a = 0; b = 0; c = 0;
        #22 rst_n = 1;
        for (i = 0; i < 50; i = i + 1) begin
            @(negedge clk);
            a = $random; b = $random; c = $random;
            exp = a * b + c;
            repeat (3) @(posedge clk);
            #1;
            if (y_half !== exp) begin errors = errors + 1; $display("HALF mismatch i=%0d exp=%h got=%h", i, exp, y_half); end
            if (y_full !== exp) begin errors = errors + 1; $display("FULL mismatch i=%0d exp=%h got=%h", i, exp, y_full); end
        end
        if (errors == 0) $display("PASS: both versions compute a*b+c");
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
