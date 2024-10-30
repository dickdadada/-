
`timescale 1ns/1ns  
  
module tb_counter;  
   
    reg sys_clk;  
    reg sys_rst_n;  
    wire led_out; 

	 always #10 sys_clk = ~sys_clk; 
	 always #100 sys_rst_n <= {$random} % 2;

    initial begin  
		  sys_clk = 0;
        sys_rst_n = 0;  
        #20;
        sys_rst_n = 1;  
        #1000000;  
        $finish;  
    end  
    initial begin  
        $monitor("Time = %0t, sys_clk = %b, sys_rst_n = %b , led_out = %b", $time , sys_clk , sys_rst_n , led_out);  
    end  
   
 counter counter_inst (  
    .sys_clk(sys_clk),  
     .sys_rst_n(sys_rst_n),  
     .led_out(led_out)  
 );  
 
endmodule