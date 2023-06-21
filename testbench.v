module jdoodle;
   reg [7:0]a,b;
   wire [7:0]out;
   bitand b1(.a(a),.b(b),.out(out));
    initial begin
        #10 a=8'b00000011;
        #10 b=8'b00000010;
        #20 $display("%b %b",out[0],out[1]);
        $display ("Welcome to JDoodle!!!");
        $finish;
    end
endmodule