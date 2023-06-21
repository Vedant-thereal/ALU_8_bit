module jdoodle;
  reg [7:0]a,b;
  wire [7:0]s;
  wire cout;
  wordaddsub add (.x(a),.y(b),.sum(s),.cot(cout));
    initial begin
        #10 a=8'b00000011;
        #10 b=8'b00000001;
        #20 $display("%b %b %b %b",s[0],s[1],s[2],cout);
        #30 $display ("Welcome to JDoodle!!!");
        #100 $finish;
    end
endmodule