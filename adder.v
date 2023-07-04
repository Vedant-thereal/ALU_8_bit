module fulladd(
 input  a,b,cin,
 output s,cout
);
 assign s=(a^b)^cin;
 assign cout=((a&b)|(a&cin)|(b&cin));
endmodule

module wordaddsub(
 input [7:0]x,
 input [7:0]y,
 input mode,//mode=1 subtraction, mode=0 addition
 output [7:0]sum,
 output cot
);
 wire [6:0]c;
 wire [8:0]p;
 assign p[0]=mode;
 wire t;
  xor(p[1],y[0],mode);
  xor(p[2],y[1],mode);
  xor(p[3],y[2],mode);
  xor(p[4],y[3],mode);
  xor(p[5],y[4],mode);
  xor(p[6],y[5],mode);
  xor(p[7],y[6],mode);
  xor(p[8],y[7],mode);
  fulladd f1(.a(x[0]),.b(p[1]),.cin(p[0]),.s(sum[0]),.cout(c[0]));
  fulladd f2(.a(x[1]),.b(p[2]),.cin(c[0]),.s(sum[1]),.cout(c[1]));
  fulladd f3(.a(x[2]),.b(p[3]),.cin(c[1]),.s(sum[2]),.cout(c[2]));
  fulladd f4(.a(x[3]),.b(p[4]),.cin(c[2]),.s(sum[3]),.cout(c[3]));
  fulladd f5(.a(x[4]),.b(p[5]),.cin(c[3]),.s(sum[4]),.cout(c[4]));
  fulladd f6(.a(x[5]),.b(p[6]),.cin(c[4]),.s(sum[5]),.cout(c[5]));
  fulladd f7(.a(x[6]),.b(p[7]),.cin(c[5]),.s(sum[6]),.cout(c[6]));
  fulladd f8(.a(x[7]),.b(p[8]),.cin(c[6]),.s(sum[7]),.cout(t));
 assign cot=(~mode)&(t);
endmodule


module syncaddsub(
 input [7:0]x,y,
 input mode,
 input clk,
 output done,cout,
 output [7:0]sum
);
 reg d=1'b0;
 assign done=d;
 wordaddsub w(.x(x),.y(y),.mode(mode),.cot(cout),.sum(sum));
 always @(posedge clk) begin
  if(~done) begin
   d=1'b1;
  end
 end
endmodule
