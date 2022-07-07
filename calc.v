`include "custom_adder.v"

module calc(A, B, C, op, res, C_out);  

    input [7:0] A, B, C;
    input [2:0] op;
    output [7:0] res;
    output C_out;

    reg c_in;

    always @(A or B or C) begin
        if (op == 2'b00) begin
            assign c_in = 0;
        end else if (op == 2'b01) begin
            assign A = ~A;
            assign c_in = 1;
        end else if (op == 2'b10) begin
            assign B = ~B;
            assign c_in = 1;
        end else if (op == 2'b11) begin
            assign C = ~C;
            assign c_in = 1;
        end

        //eight_bit_adder sp_adder (A, B, C, 0, res, C_out);
    end

    eight_bit_adder sp_adder (A, B, C, 1'b0, res, C_out);

endmodule