//16 bit sklansky adder
/*  In this adder, binary tree of propagate and generate cells will first simultaneously generate all the carries, Cin. It builds recursively 2-bit adders then 4-bit adders, 8-bit adders, 16-bit adder and so on by abutting each time two smaller adders. */

`include "gp.v"
`include "greycells.v"
`include "blackcells.v"

module sklansky(cin,a,b,S,cout);
input cin;
input [15:0] a;
input [15:0] b;
output [15:0] S;
output cout;

wire [16:0] [16:0] g;
wire [16:0] [16:0] p;

assign g[0][0]=cin;
assign p[0][0]=1'b0;
	
	GP GP_00(a[0],b[0],g[1][1],p[1][1]);
	GP GP_01(a[1],b[1],g[2][2],p[2][2]);
	GP GP_02(a[2],b[2],g[3][3],p[3][3]);
	GP GP_03(a[3],b[3],g[4][4],p[4][4]);
	GP GP_04(a[4],b[4],g[5][5],p[5][5]);
	GP GP_05(a[5],b[5],g[6][6],p[6][6]);
	GP GP_06(a[6],b[6],g[7][7],p[7][7]);
	GP GP_07(a[7],b[7],g[8][8],p[8][8]);
	GP GP_08(a[8],b[8],g[9][9],p[9][9]);
	GP GP_09(a[9],b[9],g[10][10],p[10][10]);
	GP GP_10(a[10],b[10],g[11][11],p[11][11]);
	GP GP_11(a[11],b[11],g[12][12],p[12][12]);
	GP GP_12(a[12],b[12],g[13][13],p[13][13]);
	GP GP_13(a[13],b[13],g[14][14],p[14][14]);
	GP GP_14(a[14],b[14],g[15][15],p[15][15]);
	GP GP_15(a[15],b[15],g[16][16],p[16][16]);
	
	Grey cell_1_1(g[1][1],p[1][1],g[0][0],g[1][0]);
	Black cell_1_3(g[3][3],p[3][3],g[2][2],p[2][2],g[3][2],p[3][2]);
	Black cell_1_5(g[5][5],p[5][5],g[4][4],p[4][4],g[5][4],p[5][4]);
	Black cell_1_7(g[7][7],p[7][7],g[6][6],p[6][6],g[7][6],p[7][6]);
	Black cell_1_9(g[9][9],p[9][9],g[8][8],p[8][8],g[9][8],p[9][8]);
	Black cell_1_11(g[11][11],p[11][11],g[10][10],p[10][10],g[11][10],p[11][10]);
	Black cell_1_13(g[13][13],p[13][13],g[12][12],p[12][12],g[13][12],p[13][12]);
	Black cell_1_15(g[15][15],p[15][15],g[14][14],p[14][14],g[15][14],p[15][14]);
	
	
	Grey cell_2_2(g[2][2],p[2][2],g[1][0],g[2][0]);
	Grey cell_2_3(g[3][2],p[3][2],g[1][0],g[3][0]);
	Black cell_2_6(g[6][6],p[6][6],g[5][4],p[5][4],g[6][4],p[6][4]);
	Black cell_2_7(g[7][6],p[7][6],g[5][4],p[5][4],g[7][4],p[7][4]);
	Black cell_2_10(g[10][10],p[10][10],g[9][8],p[9][8],g[10][8],p[10][8]);
	Black cell_2_11(g[11][10],p[11][10],g[9][8],p[9][8],g[11][8],p[11][8]);
	Black cell_2_14(g[14][14],p[14][14],g[13][12],p[13][12],g[14][12],p[14][12]);
	Black cell_2_15(g[15][14],p[15][14],g[13][12],p[13][12],g[15][12],p[15][12]);
	
	
	Grey cell_3_4(g[4][4],p[4][4],g[3][0],g[4][0]);
	Grey cell_3_5(g[5][4],p[5][4],g[3][0],g[5][0]);
	Grey cell_3_6(g[6][4],p[6][4],g[3][0],g[6][0]);
	Grey cell_3_7(g[7][4],p[7][4],g[3][0],g[7][0]);
	Black cell_3_12(g[12][12],p[12][12],g[11][8],p[11][8],g[12][8],p[12][8]);
	Black cell_3_13(g[13][12],p[13][12],g[11][8],p[11][8],g[13][8],p[13][8]);
	Black cell_3_14(g[14][12],p[14][12],g[11][8],p[11][8],g[14][8],p[14][8]);
	Black cell_3_15(g[15][12],p[15][12],g[11][8],p[11][8],g[15][8],p[15][8]);
	
	
	Grey cell_4_8(g[8][8],p[8][8],g[7][0],g[8][0]);
	Grey cell_4_9(g[9][8],p[9][8],g[7][0],g[9][0]);
	Grey cell_4_10(g[10][8],p[10][8],g[7][0],g[10][0]);
	Grey cell_4_11(g[11][8],p[11][8],g[7][0],g[11][0]);
	Grey cell_4_12(g[12][8],p[12][8],g[7][0],g[12][0]);
	Grey cell_4_13(g[13][8],p[13][8],g[7][0],g[13][0]);
	Grey cell_4_14(g[14][8],p[14][8],g[7][0],g[14][0]);
	Grey cell_4_15(g[15][8],p[15][8],g[7][0],g[15][0]);


  assign S[0]=g[0][0]^p[1][1];
	assign S[1]=g[1][0]^p[2][2];
	assign S[2]=g[2][0]^p[3][3];
	assign S[3]=g[3][0]^p[4][4];
	assign S[4]=g[4][0]^p[5][5];
	assign S[5]=g[5][0]^p[6][6];
	assign S[6]=g[6][0]^p[7][7];
	assign S[7]=g[7][0]^p[8][8];
	assign S[8]=g[8][0]^p[9][9];
	assign S[9]=g[9][0]^p[10][10];
	assign S[10]=g[10][0]^p[11][11];
	assign S[11]=g[11][0]^p[12][12];
	assign S[12]=g[12][0]^p[13][13];
	assign S[13]=g[13][0]^p[14][14];
	assign S[14]=g[14][0]^p[15][15];
	assign S[15]=g[15][0]^p[16][16];
	assign cout=(g[15][0]&p[16][16])|g[16][16];
	
endmodule
