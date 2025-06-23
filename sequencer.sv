class sequencer ;
	//handle of sequence_item
	sequence_item sequence_item_h;

	//handle of mailbox
	mailbox seq_drv_mbox;

	//constructor
	function new(mailbox seq_drv_mbox);
		this.seq_drv_mbox = seq_drv_mbox;
	endfunction 

	//task get_next_item for generation of sequence_item
	task get_next_item();
		sequence_item_h = new();
		sequence_item_h.randomize();
		seq_drv_mbox.put(sequence_item_h);

		`ifdef sequencer_print
			$display("[Packet from sequencer at time=%0t ] = %p", $time, sequence_item_h);
		`endif

	endtask : get_next_item	

	//run task for number of packet generation
	task run();
		repeat(5) begin
			get_next_item();
		end // repeat
	endtask : run

endclass : sequencer
