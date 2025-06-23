module adder #(parameter width=8) (input [width-1:0] in1, in0, output [width-1:0]sum_out, output carry_out);

assign {carry_out, sum_out} = in1 + in0;

endmodule : adder
