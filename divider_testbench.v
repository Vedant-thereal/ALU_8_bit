module testbench_divider();
    reg [7:0]a,b;
    reg clk;
    wire [7:0]q,r;
    wire done;
    divider d(.a(a),.b(b),.clk(clk),.q(q),.r(r),.done(done));
    initial begin
        #0 a=8'b00000111;
        #0 b=8'b00000011;
        #0 clk=1'b0;
        repeat(20) begin 
         #5 clk=~clk;
        end
        #20 $display (q);
       #100 $finish;
    end
endmodule