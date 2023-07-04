module multiply(
 input [7:0]a,b,
 input clk,
 output [15:0]op,
 output done
);
 reg [15:0]acc1=16'b0;
 reg [15:0]acc2=16'b0;
 reg [3:0]cnt=4'b0;
 assign done=cnt[3];
 assign op=acc1;
 always @(posedge clk) begin 
  if(~done) begin
   acc2={{a&({8{b[cnt]}})},8'b0};
   acc1=acc1+acc2;
   acc1=acc1>>1;
   cnt=cnt+1;
  end
  
 end
endmodule


