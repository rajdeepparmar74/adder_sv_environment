class driver;
	//handle of sequencer
	sequence_item sequence_item_h;

	//handle of interface
	virtual interface my_if vif;

	//handle of mailbox
	mailbox seq_drv_mbox;

	//constructor
	function new(mailbox seq_drv_mbox);
		this.seq_drv_mbox = seq_drv_mbox;
	endfunction

	//run task
	task run();
		forever begin
			seq_drv_mbox.get(sequence_item_h);
			vif.send_to_dut(sequence_item_h);

			`ifdef driver_print
				$display("[Packet from driver at time=%0t]: %p", $time, sequence_item_h);
			`endif
		end // forever
	endtask : run

endclass : driver
