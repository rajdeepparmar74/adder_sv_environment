module testbench;
logic clk;

	//Handle of verification_component
	verification_component verification_component_h;

	//Instance of interface
	my_if if0(clk);

	//Instance of DUT
	adder u_adder(if0.in1, if0.in0, if0.sum_out, if0.carry_out);

	initial begin
		clk = 'b0;
	end

	always begin
		#5; clk = ~clk;
	end //always 

	initial begin
		verification_component_h = new("verification_component");
		verification_component_h.configure(if0);
		verification_component_h.run(5);
		$finish;
	end

endmodule : testbench
