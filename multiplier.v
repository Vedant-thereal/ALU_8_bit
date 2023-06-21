module multiplier(
  input [7:0]a,b,
  input clk,
  output [7:0]mul,
  output car,dn
);
  reg inp=[3:0]a;
  reg acc=4'b0;
  wire [7:0]s;
  reg done=0
  always(@((posedge clk) begin
    if(!done) begin
    acc=acc+
     {car,[6:0]mul}=
  



module jdoodle;
    initial begin
        $display ("Welcome to JDoodle!!!");
        $finish;
    end
endmodule