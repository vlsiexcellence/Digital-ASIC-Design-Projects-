module async_event_detectotr_TB;
  
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
    
    
    
