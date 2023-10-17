`timescale 1us/1ns

module ALU_TOP_tb #(parameter WIDTH=16)
();
 reg      [WIDTH-1:0]      A_tb,B_tb;
 reg      [3:0]                ALU_FUN_tb;
 reg                             Clk_tb,RST_tb;
 wire    [WIDTH-1:0]      Arith_OUT_tb,Logic_OUT_tb,CMP_OUT_tb,SHIFT_OUT_tb;
 wire                           Carry_OUT_tb,Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,SHIFT_Flag_tb;

//initial Block//

initial
 begin
  $dumpfile("ALU_TOP.vcd") ;
  $dumpvars ;
  Clk_tb=0 ;
  ALU_FUN_tb=4'b0 ;
  A_tb=16'b1110 ; //14
  B_tb=16'b0111 ; //7
  RST_tb=1'b1;
  
  $display("TEST CASE 1") ; //test case for Addition
  #3
  ALU_FUN_tb=4'b0 ;
  #7
  if (Arith_OUT_tb=='b10101 & Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb&!Carry_OUT_tb)
   $display ("TEST CASE 1 is Passed") ;
  else
   $display ("TEST CASE 1 is Failed") ;

  $display("TEST CASE 2") ; //test case for Subtraction
  #3
  ALU_FUN_tb=4'b0001 ;
  #7
  if (Arith_OUT_tb=='b111& Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb&!Carry_OUT_tb)
   $display ("TEST CASE 2 is Passed") ;
  else
   $display ("TEST CASE 2 is Failed") ;

  $display("TEST CASE 3") ; //test case for Multiplication
  #3
  ALU_FUN_tb=4'b0010 ;
  #7
  if (Arith_OUT_tb=='b1100010& Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb&!Carry_OUT_tb)
   $display ("TEST CASE 3 is Passed") ;
  else
   $display ("TEST CASE 3 is Failed") ;

  $display("TEST CASE 4") ; //test case for Division
  #3
  ALU_FUN_tb=4'b0011 ;
  #7
  if (Arith_OUT_tb==16'b10& Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb&!Carry_OUT_tb)
   $display ("TEST CASE 4 is Passed") ;
  else
   $display ("TEST CASE 4 is Failed") ;

  $display("TEST CASE 5") ; //test case for AND
  #3
  ALU_FUN_tb=4'b0100 ;
  #7
  if (Logic_OUT_tb=='b110& !Arith_Flag_tb & Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 5 is Passed") ;
  else
   $display ("TEST CASE 5 is Failed") ;

  $display("TEST CASE 6") ; //test case for OR
  #3
  ALU_FUN_tb=4'b0101 ;
  #7
  if (Logic_OUT_tb=='b1111& !Arith_Flag_tb & Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 6 is Passed") ;
  else
   $display ("TEST CASE 6 is Failed") ;

  $display("TEST CASE 7") ; //test case for NAND
  #3
  ALU_FUN_tb=4'b0110 ;
  #7
  if (Logic_OUT_tb=='b1111111111111001& !Arith_Flag_tb & Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 7 is Passed") ;
  else
   $display ("TEST CASE 7 is Failed") ;

  $display("TEST CASE 8") ; //test case for NOR
  #3
  ALU_FUN_tb=4'b0111 ;
  #7
  if (Logic_OUT_tb=='b1111111111110000& !Arith_Flag_tb & Logic_Flag_tb&!CMP_Flag_tb&!SHIFT_Flag_tb)
  $display ("TEST CASE 8 is Passed") ;
  else
  $display ("TEST CASE 8 is Failed") ;

  $display("TEST CASE 9") ; //test case for nop
  #3
  ALU_FUN_tb=4'b1000 ;
  #7
  if (CMP_OUT_tb=='b0& !Arith_Flag_tb & !Logic_Flag_tb&CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 9 is Passed") ;
  else
   $display ("TEST CASE 9 is Failed") ;
   
  $display("TEST CASE 10") ; //test case for equality
  #3
  ALU_FUN_tb=4'b1001 ;
  A_tb=16'b1010 ;
  B_tb=16'b1010 ;
  #7
  if (CMP_OUT_tb=='b1& !Arith_Flag_tb & !Logic_Flag_tb&CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 10 is Passed") ;
  else
   $display ("TEST CASE 10 is Failed") ;
   
  $display("TEST CASE 11") ; //test case for More than
  #3
  ALU_FUN_tb=4'b1010 ;
  A_tb=16'b1011 ;
  B_tb=16'b1010 ;
  #7
  if (CMP_OUT_tb=='b10& !Arith_Flag_tb & !Logic_Flag_tb&CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 11 is Passed") ;
  else
   $display ("TEST CASE 11 is Failed") ;

  $display("TEST CASE 12") ; //test case for less than
  #3
  ALU_FUN_tb=4'b1011 ;
  A_tb=16'b1010 ;
  B_tb=16'b1011 ;
  #7
  if (CMP_OUT_tb=='b11& !Arith_Flag_tb & !Logic_Flag_tb&CMP_Flag_tb&!SHIFT_Flag_tb)
   $display ("TEST CASE 12 is Passed") ;
  else
   $display ("TEST CASE 12 is Failed") ;

  $display("TEST CASE 13") ; //test case for shift right of A
  #3
  ALU_FUN_tb=4'b1100 ;
  A_tb='b1100 ;
  #7
  if (SHIFT_OUT_tb=='b0110& !Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&SHIFT_Flag_tb)
   $display ("TEST CASE 13 is Passed") ;
  else
   $display ("TEST CASE 13 is Failed") ;

  $display("TEST CASE 14") ; //test case for shift left of A
  #3
  ALU_FUN_tb=4'b1101 ;
  A_tb='b1100 ;
  #7
  if (SHIFT_OUT_tb=='b11000& !Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&SHIFT_Flag_tb)
   $display ("TEST CASE 14 is Passed") ;
  else
   $display ("TEST CASE 14 is Failed") ;

  $display("TEST CASE 15") ; //test case for shift right of B
  #3
  ALU_FUN_tb=4'b1110 ;
  B_tb='b11100 ;
  #7
  if (SHIFT_OUT_tb=='b01110& !Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&SHIFT_Flag_tb)
   $display ("TEST CASE 15 is Passed") ;
  else
   $display ("TEST CASE 15 is Failed") ;
   
  $display("TEST CASE 16") ; //test case for shift left of B
  #3
  ALU_FUN_tb=4'b1111 ;
  B_tb='b11100 ;
  #7
  if (SHIFT_OUT_tb=='b111000& !Arith_Flag_tb & !Logic_Flag_tb&!CMP_Flag_tb&SHIFT_Flag_tb)
   $display ("TEST CASE 16 is Passed") ;
  else
   $display ("TEST CASE 16 is Failed") ;
   
  #5
 $finish ;
end 
 
 //Clock Generation//
 
always
 begin 
  #4 Clk_tb=~Clk_tb;
  #6 Clk_tb =~Clk_tb;
 end
 
 // DUT instantiation//
 
 ALU_TOP DUT (
.A(A_tb),
.B(B_tb),
.ALU_FUN(ALU_FUN_tb),
.Clk(Clk_tb),
.Arith_OUT(Arith_OUT_tb),
.Logic_OUT(Logic_OUT_tb),
.CMP_OUT(CMP_OUT_tb),
.SHIFT_OUT(SHIFT_OUT_tb),
.Carry_OUT(Carry_OUT_tb),
.Arith_Flag(Arith_Flag_tb),
.Logic_Flag(Logic_Flag_tb),
.CMP_Flag(CMP_Flag_tb),
.SHIFT_Flag(SHIFT_Flag_tb),
.RST(RST_tb)
);
 
 endmodule