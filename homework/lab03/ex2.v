`timescale 10ns/10ns

module c (
    clk,
    rst
);

input clk;
input rst;

reg [15:0] r1;
reg [15:0] r2;

wire [15:0] si, si1, si2;
assign #2 si = si1 + si2;
assign #1 si1 = r1;
assign #1 si2 = r2;

// assign 

always @(posedge clk or rst) begin
    if (rst) begin
        r1 <= 1;
        r2 <= 0;    
    end
    else begin
        r1 <= si;
        r2 <= si1;
    end
end
    
endmodule
