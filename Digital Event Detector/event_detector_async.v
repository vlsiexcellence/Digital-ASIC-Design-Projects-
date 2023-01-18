module event_detector_async(

		input     clk,
		input     reset_n,
		input     i_Data,
		output    o_Event
  );

  reg r_ff;   // Declare internal variables 

  always @(posedge clk or negedge reset_n) // Register the i_Data
		begin
       if(!reset_n)
				r_ff <= 1'b0;
			else
				r_ff <= i_Data;
			end
  assign o_Event = (i_Data)^(r_ff); // o_Event Generation
endmodule
