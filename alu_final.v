`include "adder.v"
`include "multiplier.v"
`include "divider.v"
`include "bitwise_and.v"
`include "bitwise_or.v"
`include "bitwise_nand.v"
`include "bitwise_nor.v"


module ALU(
 input [7:0]a,b,
 input clk,
 input [2:0]mode,
 output [7:0]op1,op2,
 output [15:0]op3,
 output done
);
  wire [7:0]out[6:0];
  wire [15:0]mul;
  reg [15:0]ml;
  assign op3=ml;
  wire [6:0]dn;
  wire c;
  reg [7:0]p1,p2;
  assign op1=p1;
  assign op2=p2;
  reg dx;
  assign done=dx;
  syncaddsub t1(.x(a),.y(b),.mode(mode[0]),.clk(clk),.done(dn[0]),.cout(c),.sum(out[0]));
  multiply t2(.a(a),.b(b),.clk(clk),.op(mul),.done(dn[1]));
  divider t3(.a(a),.b(b),.clk(clk),.q(out[1]),.r(out[2]),.done(dn[2]));
  bit_and t4(.x(a),.y(b),.clk(clk),.sum(out[3]),.done(dn[3]));
  bit_or t5(.x(a),.y(b),.clk(clk),.sum(out[4]),.done(dn[4]));
  bit_nor t6(.x(a),.y(b),.clk(clk),.sum(out[5]),.done(dn[5]));
  bit_nand t7(.x(a),.y(b),.clk(clk),.sum(out[6]),.done(dn[6]));
  always @(posedge clk) begin
    case(mode)
     3'b000: begin
             p1<=out[0];//addition
             p2<={7'b0,c};
             ml<=16'b0;
             dx<=dn[0];
             end
             
     3'b001: begin
             p1<=out[0];//subtraction
             p2<={7'b0,c};
             ml<=16'b0;
             dx<=dn[0];
             end
     3'b010:begin
            p1<=0;//multiplication
            p2<=8'b0;
            ml<=mul;
            dx<=dn[1];
            end
     3'b011:begin
            p1<=out[1];//division
            p2<=out[2];
            ml<=16'b0;
            dx<=dn[2];
            end
     3'b100:begin
            p1<=out[3];//bitwise and
            p2<=8'b0;
            ml<=16'b0;
            dx<=dn[3];
            end
     3'b101:begin
            p1<=out[4];//bitwise or
            p2<=8'b0;
            ml<=16'b0;
            dx<=dn[4];
            end
     3'b110:begin
            p1<=out[5];// bitwise nor
            p2<=8'b0;
            ml<=16'b0;
            dx<=dn[5];
            end
     3'b111:begin
            p1<=out[6];//bitwise nand
            p2<=8'b0;
            ml<=16'b0;
            dx<=dn[6];
            end
     default:begin
             p1<=8'b0;
             p2<=8'b0;
             ml<=16'b0;
             end
    endcase
   end
 endmodule