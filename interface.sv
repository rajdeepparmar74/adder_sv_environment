interface my_if #(parameter width = 8) (input clk) ;
	logic [width-1:0] in1, in0;
	logic [width-1:0] sum_out;
	logic carry_out;

	//send_to_dut task to send data to dut
	task send_to_dut(sequence_item sequence_item_h);
		@(negedge clk) begin
			in1 = sequence_item_h.in1;
			in0 = sequence_item_h.in0;
		end // negedge clk 
	endtask : send_to_dut

	task collect_pkt(output sequence_item sequence_item_h);
		@(posedge clk) begin
			sequence_item_h = new();
			sequence_item_h.in1 = in1;
			sequence_item_h.in0 = in0;
			sequence_item_h.sum_out = sum_out;
			sequence_item_h.carry_out = carry_out;
		end //posedge clk
	endtask : collect_pkt

endinterface : my_if
