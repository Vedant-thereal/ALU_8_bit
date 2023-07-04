module divider(
 input [7:0]a,b,//a=dividend,b=divisor
 input clk,
 output [7:0]q,r,//q=quotient,r=remainder 
 output done
);
  reg [7:0]t;
  assign r=t;
  reg [7:0]y;
  reg lod=1'b0;
  always @(posedge clk) begin
   if(~lod) begin
    y[0]<=a[0];
    y[1]<=a[1];
    y[2]<=a[2];
    y[3]<=a[3];
    y[4]<=a[4];
    y[5]<=a[5];
    y[6]<=a[6];
    y[7]<=a[7];
    t[0]<=1'b0;
    t[1]<=1'b0;
    t[2]<=1'b0;
    t[3]<=1'b0;
    t[4]<=1'b0;
    t[5]<=1'b0;
    t[6]<=1'b0;
    t[7]<=1'b0;
    lod=1'b1;
    end
  end
  assign q=y;
  reg [3:0]p=4'b0;
  assign done=p[3]&p[0];
  reg[7:0]s;
  always @(posedge clk) begin
   if(~done) begin
   {t,y}={t,y}<<1;
    s=t;
    t=t-b;
    if(t[7]) begin
     y[0]=1'b0;
     t=s;
    end
    else begin
    y[0]=1'b1;
    end
    p=p+1;
   end
  end
endmodule 