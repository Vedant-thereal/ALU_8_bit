module fulladd(
 input  a,b,cin,
 output s,cout
);
 assign s=(a^b)^cin;
 assign cout=((a&b)|(a&cin)|(b&cin));
endmodule




module wordaddsub(
 input [7:0]x,
 input [7:0]y,//mode=0 subtraction, mode=1 addition
 output [7:0]sum,
 output cot
);
 wire [6:0]c;
 
 fulladd f1(.a(x[0]),.b(y[0]),.cin(1'b0),.s(sum[0]),.cout(c[0]));
 fulladd f2(.a(x[1]),.b(y[1]),.cin(c[0]),.s(sum[1]),.cout(c[1]));
 fulladd f3(.a(x[2]),.b(y[2]),.cin(c[1]),.s(sum[2]),.cout(c[2]));
 fulladd f4(.a(x[3]),.b(y[3]),.cin(c[2]),.s(sum[3]),.cout(c[3]));
 fulladd f5(.a(x[4]),.b(y[4]),.cin(c[3]),.s(sum[4]),.cout(c[4]));
 fulladd f6(.a(x[5]),.b(y[5]),.cin(c[4]),.s(sum[5]),.cout(c[5]));
 fulladd f7(.a(x[6]),.b(y[6]),.cin(c[5]),.s(sum[6]),.cout(c[6]));
 fulladd f8(.a(x[7]),.b(y[7]),.cin(c[6]),.s(sum[7]),.cout(cot));
endmodule

