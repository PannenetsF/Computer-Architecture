`include "test.v"
module moduleName (

);

reg clk;
reg rst;

always #10 clk = ~clk;


c u(clk, rst);

initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    clk = 0;
    rst = 1;
    #40 rst = 0;
    #30;
    #1000;
    $finish;
end

endmodule