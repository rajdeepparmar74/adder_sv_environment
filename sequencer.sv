class sequencer ;
	
	//Handle of the sequence_item with different constraint for
	//constrained random data generation
	sequence_item seq_item;
	sequence_item_in0_0_50 seq_item_in0_0_50;
	sequence_item_in1_50_100 seq_item_in1_50_100;

	//Constructor having super.new for hierarchy
	function new(string name );
	endfunction

	//get_next_item function to generate random data for the sequencer
	function void get_next_item(output sequence_item seq_item);
		randcase 
			80: begin
				seq_item_in0_0_50 = new("sequence_item_in0_0_50" );
				seq_item = seq_item_in0_0_50;
				seq_item.randomize();
				`ifdef sequencer_print
					$display("[Packet from sequencer]: %0p", seq_item);
				`endif
			    end
			20: begin
				seq_item_in1_50_100 = new("sequence_item_in1_50_100" );
				seq_item = seq_item_in1_50_100;
				seq_item.randomize();
				`ifdef sequencer_print
					$display("[Packet from sequencer]: %0p", seq_item);
				`endif
			    end


		endcase
	endfunction : get_next_item

endclass : sequencer
