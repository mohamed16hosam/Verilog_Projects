`timescale 1us/1ns

module Register_File_tb ();

reg          [15:0]          WrData_tb;
reg          [2:0]            Address_tb;
reg                             WrEn_tb,RdEn_tb,CLK_tb,RST_tb;
wire         [15:0]          RdData_tb; 

initial
 begin
     $dumpfile("Register_File.vcd") ;
	 $dumpvars ;
	 
	 initialize();
	 
	 reset();
	 
	 #4
	 
	 $display("Test Case 1") ;  // 1st writing and reading test
	 #3
	 WrEn_tb=1'b1 ;
	 RdEn_tb=1'b0 ;
	 Address_tb=3'b101 ;
	 WrData_tb=16'b1011 ;
	 
	 #10
	 WrEn_tb=1'b0 ;
	 RdEn_tb=1'b1 ;
	 Address_tb=3'b101 ;
	 
	 #7
	 
	 if(RdData_tb==WrData_tb)
	     $display("Test Case 1 has passed") ;
	  else
	     $display("Test Case 1 has failed") ;
	 
	 $display("Test Case 2") ; // 2nd writing and reading test
	 #3
	 WrEn_tb=1'b1 ;
	 RdEn_tb=1'b0 ;
	 Address_tb=3'b10 ;
	 WrData_tb=16'b11111 ;
	 
	 #10
	 WrEn_tb=1'b0 ;
	 RdEn_tb=1'b1 ;
	 Address_tb=3'b10 ;
	 
	 #7
	 
	 if(RdData_tb==WrData_tb)
	     $display("Test Case 2 has passed") ;
	  else
	     $display("Test Case 2 has failed") ;
	 
     $finish ;	
 end
 
task reset ();
 begin
     RST_tb=1'b1 ;
	 #3
	 RST_tb=1'b0 ;
	 #3
	 RST_tb=1'b1 ;
 end
 endtask

task initialize();
 begin
     CLK_tb=1'b0 ;
	 WrEn_tb=1'b0 ;
	 RdEn_tb=1'b0 ;
 end
endtask
 
always #5 CLK_tb=~CLK_tb ;

Register_File DUT (
.WrData(WrData_tb),
.Address(Address_tb),
.WrEn(WrEn_tb),
.RdEn(RdEn_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.RdData(RdData_tb)
);

endmodule