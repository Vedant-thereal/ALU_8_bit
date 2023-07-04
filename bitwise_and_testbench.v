`include "bitwise_and.v"
module testbench_bitand();
    reg [7:0]a,b;
    reg clk;
    wire done;
    wire [7:0]out;
    bit_and w(.x(a),.y(b),.clk(clk),.done(done),.sum(out));
    initial begin
        #0 a=8'b00000111;
        #0 b=8'b00000010;
        #0 clk=1'b0;
        repeat(10) begin
         #5 clk=~clk;
        end
        #20 $display (out);
        $finish;
    end
endmodule
