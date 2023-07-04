module testbench_multiplier();
    reg [7:0]a,b;
    reg clk;
    wire [15:0]s;
    wire done;
    multiply m1(.a(a),.b(b),.clk(clk),.op(s),.done(done));
    initial begin
        #0 a=8'b10000011;
        #0 b=8'b10000010;
        #0 clk=0;
        repeat(20) begin
         #5 clk=~clk;
        end
        #50 $display (s);
        #100 $finish;
    end
endmodule
