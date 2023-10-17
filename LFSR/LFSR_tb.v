`timescale 1ns/1ps 

module LFSR_tb();
 
 reg                            RST_tb,CLK_tb;
 reg             [3:0]        seed_tb;
 wire                           OUT_tb,valid_tb;

initial
 begin
  $dumpfile("LFSR.vcd") ;
  $dumpvars ;
  initialize();
  
  reset();
  
  #890


  // LFSR=4'b1100 //
  
  if(OUT_tb==1'b0 & valid_tb)
   $display("TEST CASE 1 HAS PASSED") ;
  else
   $display("TEST CASE 1 HAS FAILED") ;
   
   #100
   
  if(OUT_tb==1'b0 & valid_tb)
   $display("TEST CASE 2 HAS PASSED") ;
  else
   $display("TEST CASE 2 HAS FAILED") ;   

   #100
   
  if(OUT_tb==1'b1 & valid_tb)
   $display("TEST CASE 3 HAS PASSED") ;
  else
   $display("TEST CASE 3 HAS FAILED") ;

   #100

  if(OUT_tb==1'b1 & valid_tb)
   $display("TEST CASE 4 HAS PASSED") ;
  else
   $display("TEST CASE 4 HAS FAILED") ;   

   #100
   
  $finish ;
 end

task initialize;
     begin
        CLK_tb=1'b0;
		seed_tb= 4'b1001;
	 end	 
endtask
 
task reset;
     begin
        RST_tb=1'b0;
		#10
		RST_tb=1'b1;
	 end	 
endtask
 
always #50 CLK_tb=~CLK_tb ; 
 
LFSR DUT(
.RST(RST_tb),
.CLK(CLK_tb),
.seed(seed_tb),
.OUT(OUT_tb),
.valid(valid_tb)
);

endmodule