/*Generate and Propagate procedure(splitting into wires )*/

module GP(A,B,G,P);
input A,B;
output G,P;
assign G = A&B;
assign P = A^B;
endmodule
