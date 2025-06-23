class driver ;
	//reference handle of the sequencer for connection at the agent
	sequencer seq_drv_h;
	
	//Handle of interface for sending the data to DUT
	virtual interface my_if vif;

	//Handle of the packet for get_next_item
	sequence_item seq_item;
	//Constructor for hierarchy
	function new(string name );
	endfunction

	//run task to get the item from the sequencer and send it to DUT
	task run(int runs); 
		repeat(runs) begin 
			seq_drv_h.get_next_item(seq_item);
			vif.send_to_dut(seq_item);
			`ifdef driver_print
				$display("[Packet from driver]: %0p", seq_item);
			`endif
		end //repeat loop

	endtask : run
		
endclass : driver
