module counter(  
    input wire sys_clk,          
    input wire sys_rst_n,        
    output reg led_out           
);  
  
    parameter HALF_SECOND_CYCLES = 24999999;  
  
    reg [24:0] cnt;  

	 always @(posedge sys_clk or negedge sys_rst_n) begin
    if (sys_rst_n == 1'b0)   
        cnt <= 25'd0;       
    else if (cnt == HALF_SECOND_CYCLES)   
        cnt <= 25'd0;       
    else
        cnt <= cnt + 25'd1; 
	 end
always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
 led_out <= 1'b0;
 else if( cnt >= HALF_SECOND_CYCLES )
 led_out <= 1'b0;
 else
 led_out <= 1'b1;
  
endmodule
