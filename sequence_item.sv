class sequence_item #(parameter width=8) ;
	rand	logic[width-1:0]in1;
	rand 	logic[width-1:0]in0;
		logic[width-1:0]sum_out ;
		logic		carry_out;

	function new(string name );
	endfunction

endclass : sequence_item

class sequence_item_in1_50_100 extends sequence_item;

	function new(string name );
		super.new(name);
	endfunction 

	constraint c_in1_50_100 {
		in1 inside {[50:100]};
		in0 == 0;
		}

endclass : sequence_item_in1_50_100

class sequence_item_in0_0_50 extends sequence_item;

	function new(string name );
		super.new(name);
	endfunction

	constraint c_in0_0_50 {
		in1 == 0;
		in0 inside {[0:50]};
		} 

endclass : sequence_item_in0_0_50
