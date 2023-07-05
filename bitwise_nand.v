




module bit_nand(
 input [7:0]x,
 input [7:0]y,
 input clk,
 output done,
 output [7:0]sum
);
 
reg d=1'b0;
 assign done=d;
 assign sum = x~&y;
 always @(posedge clk) begin
  if(~done) begin
   d=1'b1;
  end
 end
  
endmodule

