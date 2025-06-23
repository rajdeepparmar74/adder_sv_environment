class agent ;
	//Handle of sequencer, driver, monitor as a container class named as
	//agent
	sequencer seq;
	driver drv;
	monitor mon;

	function new(string name );
		seq = new("seq" );
		drv = new("drv" );
		mon = new("mon" );
		//Connection to driver's reference handle to sequencer
		drv.seq_drv_h = seq;
	endfunction

endclass : agent
