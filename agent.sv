class agent;
	sequencer seq;
	driver drv;
	monitor mon;

	//handle of mailbox for instance for seq->drv
	mailbox seq_drv_mbox;

	function new();
		this.seq_drv_mbox = new();
		seq = new(seq_drv_mbox);
		drv = new(seq_drv_mbox);
		mon = new();
	endfunction 

endclass : agent
