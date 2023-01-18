

/* 𝐌𝐨𝐝𝐮𝐥𝐞 𝐄𝐯𝐞𝐧𝐭 𝐃𝐞𝐭𝐞𝐜𝐭𝐨𝐫 (𝐰𝐢𝐭𝐡𝐨𝐮𝐭 𝐢𝐧𝐩𝐮𝐭 𝐝𝐚𝐭𝐚 𝐬𝐲𝐧𝐜 𝐢𝐧)

   𝐀𝐮𝐭𝐡𝐨𝐫: 𝐆𝐲𝐚𝐧 𝐂𝐡𝐚𝐧𝐝 𝐃𝐡𝐚𝐤𝐚 (𝐌.𝐓𝐞𝐜𝐡, 𝐌𝐢𝐜𝐫𝐨-𝐄𝐥𝐞𝐜𝐭𝐫𝐨𝐧𝐢𝐜𝐬 & 𝐕𝐋𝐒𝐈 𝐃𝐞𝐬𝐢𝐠𝐧)
 
   𝐌𝐲 𝐘𝐨𝐮𝐓𝐮𝐛𝐞 𝐂𝐡𝐚𝐧𝐧𝐞𝐥: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐲𝐨𝐮𝐭𝐮𝐛𝐞.𝐜𝐨𝐦/@𝐯𝐥𝐬𝐢𝐞𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞

   𝐅𝐨𝐥𝐥𝐨𝐰 𝐦𝐞 𝐨𝐧 𝐋𝐢𝐧𝐤𝐞𝐝𝐢𝐧: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐥𝐢𝐧𝐤𝐞𝐝𝐢𝐧.𝐜𝐨𝐦/𝐢𝐧/𝐠𝐲𝐚𝐧-𝐜𝐡𝐚𝐧𝐝-𝐝𝐡𝐚𝐤𝐚-𝐚792971𝐚2/

   𝐅𝐨𝐥𝐥𝐨𝐰 𝐕𝐋𝐒𝐈 𝐄𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞 𝐏𝐚𝐠𝐞 𝐨𝐧 𝐋𝐢𝐧𝐤𝐞𝐝𝐢𝐧: 𝐡𝐭𝐭𝐩𝐬://𝐰𝐰𝐰.𝐥𝐢𝐧𝐤𝐞𝐝𝐢𝐧.𝐜𝐨𝐦/𝐢𝐧/𝐯𝐥𝐬𝐢-𝐞𝐱𝐜𝐞𝐥𝐥𝐞𝐧𝐜𝐞-𝐠𝐲𝐚𝐧-𝐜𝐡𝐚𝐧𝐝-𝐝𝐡𝐚𝐤𝐚-101𝐛𝐚𝐚247/ 

*/

// Code your design here

module event_detector_async(

		input     clk,
		input     reset_n,
		input     i_Data,
		output    o_Event
    );

  reg r_ff;   // Declare internal variables 

  always @(posedge clk or negedge reset_n) // Register the data_in
		begin
          if(!reset_n)
				r_ff <= 1'b0;
			else
				r_ff <= i_Data;
			end
  assign o_Event = (i_Data)^(r_ff); // event_out Generation
endmodule


