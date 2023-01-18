/* 𝐌𝐨𝐝𝐮𝐥𝐞 𝐄𝐯𝐞𝐧𝐭 𝐃𝐞𝐭𝐞𝐜𝐭𝐨𝐫 TB (𝐰𝐢𝐭𝐡𝐨𝐮𝐭 𝐢𝐧𝐩𝐮𝐭 𝐝𝐚𝐭𝐚 𝐬𝐲𝐧𝐜 𝐢𝐧)
   𝐀𝐮𝐭𝐡𝐨𝐫: 𝐆𝐲𝐚𝐧 𝐂𝐡𝐚𝐧𝐝 𝐃𝐡𝐚𝐤𝐚 (𝐌.𝐓𝐞𝐜𝐡, 𝐌𝐢𝐜𝐫𝐨-𝐄𝐥𝐞𝐜𝐭𝐫𝐨𝐧𝐢𝐜𝐬 & 𝐕𝐋𝐒𝐈 𝐃𝐞𝐬𝐢𝐠𝐧) 
   𝐌𝐲 𝐘𝐨𝐮𝐓𝐮𝐛𝐞 𝐂𝐡𝐚𝐧𝐧𝐞𝐥: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐲𝐨𝐮𝐭𝐮𝐛𝐞.𝐜𝐨𝐦/@𝐯𝐥𝐬𝐢𝐞𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞
   𝐅𝐨𝐥𝐥𝐨𝐰 𝐦𝐞 𝐨𝐧 𝐋𝐢𝐧𝐤𝐞𝐝𝐢𝐧: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐥𝐢𝐧𝐤𝐞𝐝𝐢𝐧.𝐜𝐨𝐦/𝐢𝐧/𝐠𝐲𝐚𝐧-𝐜𝐡𝐚𝐧𝐝-𝐝𝐡𝐚𝐤𝐚-𝐚792971𝐚2/
   𝐅𝐨𝐥𝐥𝐨𝐰 𝐕𝐋𝐒𝐈 𝐄𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞 𝐏𝐚𝐠𝐞 𝐨𝐧 𝐋𝐢𝐧𝐤𝐞𝐝𝐢𝐧: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐥𝐢𝐧𝐤𝐞𝐝𝐢𝐧.𝐜𝐨𝐦/𝐢𝐧/𝐯𝐥𝐬𝐢-𝐞𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞-𝐠𝐲𝐚𝐧-𝐜𝐡𝐚𝐧𝐝-𝐝𝐡𝐚𝐤𝐚-101𝐛𝐚𝐚247/ 
*/

// Code your design here

module async_event_detector_TB;
  
  reg       clk;
  reg       reset_n;
  reg       i_Data;
  wire      o_Event;
  
  //Instantiate Design Under Test
  event_detector_async DUT(
    
    .clk          (clk), 
    .reset_n      (reset_n), 
    .i_Data       (i_Data), 
    .o_Event      (o_Event)
  );
  
  //Generate a 10 ns  Time Period Clock 
  always #5 clk = ~clk;
  
  //Drive the DUT or Generate stimuli for the DUT
  initial begin
    clk = 0;
    reset_n = 1;
    i_Data = 1'b0;
    
    // Assert the Asynchronous Reset after 1 clock period 
    #1 reset_n = 0;
    
    //Deassert the Reset
    #5 reset_n = 1;
    
    @(posedge clk) i_Data = 1'b0;    
    
    @(posedge clk) i_Data = 1'b1;
    
    @(posedge clk) i_Data = 1'b1;
    
    @(posedge clk) i_Data = 1'b1;
    
    @(negedge clk) i_Data = 1'b0;
    
    @(posedge clk) i_Data = 1'b0;
    
    @(posedge clk) i_Data = 1'b0;
    
    @(negedge clk) i_Data = 1'b1;
       
    #100 $finish;
  end
  
   initial begin
    // below two lines are used to show waveform
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
    
    
