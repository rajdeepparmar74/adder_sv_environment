interface my_if #(parameter width=8) (input clk) ;
	logic [width-1:0]in1;
	logic [width-1:0]in0;
	logic [width-1:0]sum_out;
	logic carry_out;

	task send_to_dut(sequence_item seq_item);
		@(negedge clk) begin
			in1 = seq_item.in1;
			in0 = seq_item.in0;
		end //posedge clk
	endtask : sent_to_dut

	task collect_pkt(output sequence_item seq_item);
		@(posedge clk) begin
			seq_item = new("seq_item");
			seq_item.in1 = in1;
			seq_item.in0 = in0;
			seq_item.sum_out = sum_out ;
			seq_item.carry_out = carry_out ;
		end //negedge clk
	endtask : collect_pkt

endinterface : my_if
