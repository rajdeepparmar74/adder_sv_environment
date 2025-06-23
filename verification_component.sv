class verification_component;
	//handle of sequence_item
	sequence_item sequence_item_h;

	//handle of interface
	virtual interface my_if vif;
	
	//handle of agent
	agent agn;

	//constructor
	function new();
		agn = new();
	endfunction

	//configure task
	task configure(virtual interface my_if vif);
		agn.drv.vif = vif;
		agn.mon.vif = vif;
	endtask : configure

	//run task
	task run();
		fork
			agn.seq.run();
			agn.drv.run();
		join_none
			agn.mon.run();
	endtask : run

endclass: verification_component
