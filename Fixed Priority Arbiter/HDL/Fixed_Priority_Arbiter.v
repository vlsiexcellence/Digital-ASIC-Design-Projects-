/*
*********************************** Fixed Priority Arbiter *************************************

Assume the priority order is : REQ[3] > REG[2] > REQ[1] > REQ[0]

Author: Gyan Chand Dhaka (M.Tech, Micro-electronics & VLSI Design)
 
My YouTube Channel: https://www.youtube.com/@vlsiexcellence

Follow me on Linkedin: https://www.linkedin.com/in/gyan-chand-dhaka-a792971a2/

Follow VLSI Excellence Page on Linkedin: https://www.linkedin.com/in/vlsi-excellence-gyan-chand-dhaka-101baa247/ 

*/

// Code your design here

module Fixed_Priority_Arbiter(

        input            clk,
	input            reset_n,
        input [3:0]      i_Req,
        output reg [3:0] o_Gnt
);

  always @ (posedge clk or negedge reset_n)
	begin		
          if(!reset_n)
				o_Gnt <= 4'b0000;
          else if(i_Req[3])
				o_Gnt <= 4'b1000;
          else if(i_Req[2])
				o_Gnt <= 4'b0100;
          else if(i_Req[1])
				o_Gnt <= 4'b0010;
          else if(i_Req[0])
				o_Gnt <= 4'b0001;
          else
				o_Gnt <= 4'b0000;
	end
endmodule//Fixed_Priority_Arbiter
