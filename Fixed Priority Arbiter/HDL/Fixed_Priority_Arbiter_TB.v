/************************************ Fixed Priority Arbiter *************************************

Assume the priority order is : REQ[3] > REG[2] > REQ[1] > REQ[0]

Author: Gyan Chand Dhaka (M.Tech, Micro-electronics & VLSI Design)
 
My YouTube Channel: https://www.youtube.com/@vlsiexcellence

Follow me on Linkedin: https://www.linkedin.com/in/gyan-chand-dhaka-a792971a2/

Follow VLSI Excellence Page on Linkedin: https://www.linkedin.com/in/vlsi-excellence-gyan-chand-dhaka-101baa247/ 

*/

// Code your design here


module Fixed_Priority_Arbiter_TB;
  
  reg          clk;
  reg          reset_n;
  reg [3:0]    i_Req;
  wire [3:0]   o_Gnt;
  
  //Instantiate Design Under Test
  
  Fixed_Priority_Arbiter DUT(
     
    .clk                 (clk), 
    .reset_n             (reset_n), 
    .i_Req               (i_Req), 
    .o_Gnt               (o_Gnt)
  );
  
  //Generate a 10 ns  Time Period Clock 
  always #5 clk = ~clk;
  
  //Drive the DUT or Generate stimuli for the DUT
  
  initial begin
    clk = 0;
    reset_n = 0;
    i_Req = 4'b0;
    // Assert the Asynchronous Reset after 1 clock period 
    //#10 rst_n = 0;
    //Deassert the Reset
    #5 reset_n = 1;
    
    @(negedge clk) i_Req = 4'b1000;    
    
    @(negedge clk) i_Req = 4'b1010;
    
    @(negedge clk) i_Req = 4'b0010;
    
    @(negedge clk) i_Req = 4'b0110;
    
    @(negedge clk) i_Req = 4'b1110;
    
    @(negedge clk) i_Req = 4'b1111;
    
    @(negedge clk) i_Req = 4'b0100;
    
    @(negedge clk) i_Req = 4'b0010;
    
    #5 reset_n = 0;    
    #100 $finish;
  end  
   initial begin
    // below two lines are used to show waveform
    $dumpfile("dump.vcd");
    $dumpvars();
  end  
endmodule
    
