//flip flop-> reg

module simple(input a, b, output reg c);

    initial begin
        c = 0;
    end

    always @(a or b) begin
        c = ((~c) & (a^b)) | (c & (a&b));
    end

    always @(b or a) begin
        c =  a|b;
    end

endmodule

module tb;

    reg a, b;
    wire c;

    simple simp1(a, b, c);
    simple simp2(a, b, c);

    initial begin
        a = 1;
        b = 1;

        $monitor("a = %b, b= %b, c = %b", a, b, c);

        #5;
        a=1; b=0;
        #5;
        a =0; b = 1;
        #5;
        a = 0; b = 0;
        #5;
    end

endmodule