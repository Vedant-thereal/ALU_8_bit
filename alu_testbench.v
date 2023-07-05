'include "alu_final.v"
module tb();
    reg [7:0]a=8'b00000011;
    reg [7:0]b=8'b00000010;
    reg clk;
    wire [15:0]op3;
    wire [7:0]op1,op2;
    wire done;
    ALU m1(.a(a),.b(b),.clk(clk),.op3(op3),.op1(op1),.op2(op2),.done(done),.mode(3'b100));
    initial begin
        #0 clk=0;
        repeat(20) begin
         #5 clk=~clk;
        end
        #20 $display(done);
        #0 $display(op1);

        #100 $finish;
    end
endmodule