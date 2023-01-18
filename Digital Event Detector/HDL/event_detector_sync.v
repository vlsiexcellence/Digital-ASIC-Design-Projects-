/*
   Module Event Detector (With Input Data Sync)
   Author: Gyan Chand Dhaka (M.Tech, Micro-Electronics & VLSI Design)
   My YouTube Channel: https://www.youtube.com/@vlsiexcellence
   Follow me on Linkedin: https://www.linkedin.com/in/gyan-chand-dhaka-a792971a2/
   Join My Linkedin Group for More VLSI Contents & Info: https://www.linkedin.com/groups/14154124/ 
   
*/
// Code your design here

module event_detector_sync(

		input       clk,
		input       reset_n,
		input       i_Data,
		output      o_Event

	);

	reg  r_ff;
	reg r_Data_in_Flop0, r_Data_in_Flop1;
	wire w_Data_in_Synced;

  always @(posedge clk or negedge reset_n) // Get the synced version of i_Data
			begin
       if(!reset_n)
         begin
					r_Data_in_Flop0 <= 1'b0;
					r_Data_in_Flop1 <= 1'b0;
         end
       else begin
					r_Data_in_Flop0 <= i_Data;
					r_Data_in_Flop1 <= r_Data_in_Flop0;
        end
      end
  
 assign w_Data_in_Synced = r_Data_in_Flop1;

 always @(posedge clk or negedge reset_n) // Register the w_Data_in_Synced
		begin
      if(!reset_n)
				r_ff <= 1'b0;
			else
				r_ff <= w_Data_in_Synced;
			end
  
 assign o_Event = (w_Data_in_Synced)^(r_ff); // o_Event Generation
  
endmodule
