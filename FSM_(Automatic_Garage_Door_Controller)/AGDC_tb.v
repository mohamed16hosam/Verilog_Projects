`timescale 1ns/1ps

module AGDC_tb ();
 reg           UP_Max_tb,DN_Max_tb,Activate_tb,CLK_tb,RST_tb ;
 wire          UP_M_tb,DN_M_tb ;

initial
 begin
     $dumpfile("AGDC.vcd") ;
	 $dumpvars ;
	 
	 initialize();
	 
	 reset();
	 
	 $display("Test Case 1") ; //IDLE
	 if (! UP_M_tb & ! DN_M_tb)
	  $display("Test Case 1 has passed") ;
	 else
	  $display("Test Case 1 has failed") ;
	 
	 #10
	 
     $display("Test Case 2") ;    //Mv_Dn
	 #5
	 Activate_tb=1'b1 ;
	 UP_Max_tb=1'b1 ;
	 DN_Max_tb=1'b0 ;
	 #15
	 if (! UP_M_tb &  DN_M_tb)
	  $display("Test Case 2 has passed") ;
	 else
	  $display("Test Case 2 has failed") ;	 
	 
	 #5
	 
     $display("Test Case 3") ;    //IDLE
	 Activate_tb=1'b1 ;
	 UP_Max_tb=1'b0 ;
	 DN_Max_tb=1'b1 ;
	 #15
	 if (! UP_M_tb &  ! DN_M_tb)
	  $display("Test Case 3 has passed") ;
	 else
	  $display("Test Case 3 has failed") ;	 
	 
	 #5
	 
     $display("Test Case 4") ;    //Mv_Up
	 Activate_tb=1'b1 ;
	 UP_Max_tb=1'b0 ;
	 DN_Max_tb=1'b1 ;
	 #15
	 if ( UP_M_tb &  ! DN_M_tb)
	  $display("Test Case 4 has passed") ;
	 else
	  $display("Test Case 4 has failed") ;	 
	
     #5
	 
     $display("Test Case 5") ;    //IDLE
	 Activate_tb=1'b1 ;
	 UP_Max_tb=1'b1 ;
	 DN_Max_tb=1'b0 ;
	 #15
	 if (! UP_M_tb &  ! DN_M_tb)
	  $display("Test Case 5 has passed") ;
	 else
	  $display("Test Case 5 has failed") ;	  
	 
	 $finish ;
 end
 
task reset();
 begin
     RST_tb=1'b1;
     #5
     RST_tb=1'b0 ;
     #5
     RST_tb=1'b1 ;	 
 end
endtask

task initialize();
 begin
     CLK_tb=1'b0 ;
	 UP_Max_tb=1'b0;
	 DN_Max_tb=1'b0;
	 Activate_tb=1'b0;
 end
endtask
always #10 CLK_tb=~CLK_tb ;

AGDC DUT(
.UP_Max(UP_Max_tb),
.DN_Max(DN_Max_tb),
.Activate(Activate_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.UP_M(UP_M_tb),
.DN_M(DN_M_tb)
);

endmodule