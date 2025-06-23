class verification_component ;
	//Handle of virtual interface for configuration
	virtual interface my_if vif;
	
	//Handle of sequence_item
	sequence_item seq_item;

	//Handle of agent
	agent agn;

	//Constructor
	function new(string name );
		//create an instance of agent
		agn = new("agn1" );
	endfunction 

	//configuration function
	function configure(virtual interface my_if vif);
		agn.drv.vif = vif;
		agn.mon.vif = vif;
	endfunction : configure

	//Run task to initiate the runs and spawn monitor process
	task run (int runs);
		fork
			agn.mon.run();
		join_none
			agn.drv.run(runs);
	endtask : run

endclass : verification_component
