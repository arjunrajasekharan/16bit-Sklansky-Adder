`include "Sklansky.v"

module top;

wire [15:0] Sum;
wire cout;
reg [15:0] A;
reg [15:0] B;
reg cin;

sklansky adder(cin,A,B,Sum,cout);

initial
begin
    cin = 1'b0;
    #0 A=345; B=134;
    #4 A=4567; B=234;
    #8 A=23; B=10;
    #12 A=6409; B=0;
end

initial
begin
    $monitor ($time, " Input: A = %d   B = %d    \n\t\t     Output: A+B = %d ",A,B,Sum);
    $dumpfile("Sklansky.vcd");
    $dumpvars;
end

endmodule
