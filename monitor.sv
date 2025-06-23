class monitor ;
	//Handle of sequence_item
	sequence_item seq_item;

	//Handle of interface for collecting data and connection to DUT
	virtual interface my_if vif;

	//Constructor containing super.new for hierarchy
	function new(string name );
	endfunction 

	//run task to collect the data from the DUT via interface
	task run();
		forever begin
		vif.collect_pkt(seq_item);
		`ifdef monitor_print
			$display("[Packet from Monitor]: %0p", seq_item);
		`endif
		end //forever loop
	endtask : run

endclass : monitor
