module testbench_adder();
    reg [7:0]a,b;
    reg clk;
    wire cot,done;
    wire [7:0]out;
    syncaddsub w(.x(a),.y(b),.mode(1'b0),.clk(clk),.done(done),.cout(cot),.sum(out));
    initial begin
        #0 a=8'b00000111;
        #0 b=8'b00000010;
        #0 clk=1'b0;
        repeat(10) begin
         #5 clk=~clk;
        end
        #20 $display (out);
        #0 $display(cot)
        $finish;
    end
endmodule
