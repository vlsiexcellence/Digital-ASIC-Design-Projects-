/*   

CLKS_PER_BITS = (Input Frequency {i_clk}/ UART Frequency {Baud Rate} 

Example : CLKS_PER_BITS = (25 MHz / 115200) = 217 

Author : VLSI Excellence - Gyan Chand Dhaka (https://www.youtube.com/@vlsiexcellence)

*/

// Code your design here

module uart_tx_controller(
  
  input              clk,
  input              reset_n,
  input [7:0]        i_Tx_Byte,
  input              i_Tx_Ready,
  output             o_Tx_Done,
  output             o_Tx_Active, // Asserted for 1 clk cycle after receiving one byte of data 
  output             o_Tx_Data
);
  
  localparam UART_TX_IDLE = 3'b000,
             UART_TX_START = 3'b001,
             UART_TX_DATA =  3'b010,
             UART_TX_STOP = 3'b011;
  
  reg [2:0]          r_Bit_Index;
  reg                r_Tx_Done;
  reg                r_Tx_Data;
  reg [2:0]          r_State;
  reg                r_Tx_Active;
   
  
  //UART TX Logic Implementation 
  
  always @(posedge clk or negedge reset_n)
    begin
      if(~reset_n)
        begin
          r_State <= UART_TX_IDLE;          
          r_Bit_Index <= 0;
          r_Tx_Done <= 1'b0;
          r_Tx_Data <= 1'b1;  
          r_Tx_Active <= 1'b0;
        end
      else 
        begin
          case(r_State)
        UART_TX_IDLE: begin       
          r_Bit_Index <= 0;
          r_Tx_Done <= 1'b0;
          r_Tx_Data <= 1'b1;
          if(i_Tx_Ready == 1'b1)
            begin
              r_State <= UART_TX_START;
              r_Tx_Active <= 1'b1;
            end
          else begin
              r_State <= UART_TX_IDLE;
          end
        end
        
        UART_TX_START: begin
              r_Tx_Data <= 1'b0;
              r_State <= UART_TX_DATA;    
            end          
        
        UART_TX_DATA: begin
          r_Tx_Data <= i_Tx_Byte[r_Bit_Index];      
          if(r_Bit_Index < 7 )
              begin
                r_Bit_Index <= r_Bit_Index + 1;
                r_State <= UART_TX_DATA;
              end
            else begin
                r_Bit_Index <= 0;
                r_State <= UART_TX_STOP;
            end
          end        
          
          UART_TX_STOP: begin          
              r_State <= UART_TX_IDLE;            
              r_Tx_Done <= 1'b1;
              r_Tx_Active <= 1'b0;
              r_Tx_Data <= 1'b1;
            end           
          
          default: begin
              r_State <= UART_TX_IDLE;
          end
          endcase
     end
    end
  assign o_Tx_Done = r_Tx_Done;
  assign o_Tx_Data = r_Tx_Data;
  assign o_Tx_Active = r_Tx_Active;
 endmodule
        
       
