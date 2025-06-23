class monitor;
	//handle of sequence
	sequence_item sequence_item_h;

	//handle of interface
	virtual interface my_if vif;

	//constructor
	function new();
	endfunction

	//run task
	task run();
		forever begin
			vif.collect_pkt(sequence_item_h);

			`ifdef monitor_print
				$display("[Packet from monitor at time=%t]: %p", $time, sequence_item_h);
			`endif 

		end // forever
	endtask : run

endclass : monitor
