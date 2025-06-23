module testbench;

logic clk;

//interface instance
my_if if0(clk);

//verification component handle
verification_component verification_component_h;

//dut instance
adder u_dut(if0.in1, if0.in0, if0.sum_out, if0.carry_out);

//initial for clk
initial begin
	clk = 'b0;
	#200; $finish;
end 

//clock generation
always begin
	#5; clk = ~clk;
end

//initial block for vc and run vc's run task
initial begin
	verification_component_h = new();
	verification_component_h.configure(if0);
	verification_component_h.run();
end

endmodule : testbench
