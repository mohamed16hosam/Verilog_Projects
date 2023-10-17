module ALU_tb ();
reg [15:0] A_tb,B_tb ;
reg [3:0] ALU_FUN_tb ;
reg CLK_tb ;
wire [15:0] ALU_OUT_tb ;
wire Arith_flag_tb,Logic_flag_tb,CMP_flag_tb,Shift_flag_tb ;

//initial Block

initial
begin
$dumpfile("ALU.vcd") ;
$dumpvars ;
CLK_tb=0 ;
ALU_FUN_tb=4'b1111 ;
A_tb=16'b1110 ; //14
B_tb=16'b0111 ; //7

$display("TEST CASE 1") ; //test case for Addition
#3000
ALU_FUN_tb=4'b0 ;
#7000
if (ALU_OUT_tb==16'b10101 & Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 1 is Passed") ;
else
$display ("TEST CASE 1 is Failed") ;

$display("TEST CASE 2") ; //test case for Subtraction
#3000
ALU_FUN_tb=4'b0001 ;
#7000
if (ALU_OUT_tb==16'b111& Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 2 is Passed") ;
else
$display ("TEST CASE 2 is Failed") ;

$display("TEST CASE 3") ; //test case for Multiplication
#3000
ALU_FUN_tb=4'b0010 ;
#7000
if (ALU_OUT_tb==16'b1100010& Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 3 is Passed") ;
else
$display ("TEST CASE 3 is Failed") ;

$display("TEST CASE 4") ; //test case for Division
#3000
ALU_FUN_tb=4'b0011 ;
#7000
if (ALU_OUT_tb==16'b10& Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 4 is Passed") ;
else
$display ("TEST CASE 4 is Failed") ;

$display("TEST CASE 5") ; //test case for AND
#3000
ALU_FUN_tb=4'b0100 ;
#7000
if (ALU_OUT_tb==16'b110& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 5 is Passed") ;
else
$display ("TEST CASE 5 is Failed") ;

$display("TEST CASE 6") ; //test case for OR
#3000
ALU_FUN_tb=4'b0101 ;
#7000
if (ALU_OUT_tb==16'b1111& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 6 is Passed") ;
else
$display ("TEST CASE 6 is Failed") ;

$display("TEST CASE 7") ; //test case for NAND
#3000
ALU_FUN_tb=4'b0110 ;
#7000
if (ALU_OUT_tb==16'b1111111111111001& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 7 is Passed") ;
else
$display ("TEST CASE 7 is Failed") ;

$display("TEST CASE 8") ; //test case for NOR
#3000
ALU_FUN_tb=4'b0111 ;
#7000
if (ALU_OUT_tb==16'b1111111111110000& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 8 is Passed") ;
else
$display ("TEST CASE 8 is Failed") ;

$display("TEST CASE 9") ; //test case for XOR
#3000
ALU_FUN_tb=4'b1000 ;
#7000
if (ALU_OUT_tb==16'b1001& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 9 is Passed") ;
else
$display ("TEST CASE 9 is Failed") ;

$display("TEST CASE 10") ; //test case for XNOR
#3000
ALU_FUN_tb=4'b1001 ;
#7000
if (ALU_OUT_tb==16'b1111111111110110& !Arith_flag_tb & Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 10 is Passed") ;
else
$display ("TEST CASE 10 is Failed") ;

$display("TEST CASE 11") ; //test case for equality
#3000
ALU_FUN_tb=4'b1010 ;
A_tb=16'b1010 ;
B_tb=16'b1010 ;
#7000
if (ALU_OUT_tb==16'b1& !Arith_flag_tb & !Logic_flag_tb&CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 11 is Passed") ;
else
$display ("TEST CASE 11 is Failed") ;

$display("TEST CASE 12") ; //test case for More than
#3000
ALU_FUN_tb=4'b1011 ;
A_tb=16'b1011 ;
B_tb=16'b1010 ;
#7000
if (ALU_OUT_tb==16'b10& !Arith_flag_tb & !Logic_flag_tb&CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 12 is Passed") ;
else
$display ("TEST CASE 12 is Failed") ;

$display("TEST CASE 13") ; //test case for less than
#3000
ALU_FUN_tb=4'b1100 ;
A_tb=16'b1010 ;
B_tb=16'b1011 ;
#7000
if (ALU_OUT_tb==16'b11& !Arith_flag_tb & !Logic_flag_tb&CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 13 is Passed") ;
else
$display ("TEST CASE 13 is Failed") ;

$display("TEST CASE 14") ; //test case for shift right
#3000
ALU_FUN_tb=4'b1101 ;
A_tb=16'b1100 ;
#7000
if (ALU_OUT_tb==16'b0110& !Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&Shift_flag_tb)
$display ("TEST CASE 14 is Passed") ;
else
$display ("TEST CASE 14 is Failed") ;

$display("TEST CASE 15") ; //test case for shift left
#3000
ALU_FUN_tb=4'b1110 ;
A_tb=16'b1100 ;
#7000
if (ALU_OUT_tb==16'b11000& !Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&Shift_flag_tb)
$display ("TEST CASE 15 is Passed") ;
else
$display ("TEST CASE 15 is Failed") ;

$display("TEST CASE 16") ; //test case for Default
#3000
ALU_FUN_tb=4'b1111 ;
A_tb=16'b1100 ;
#7000
if (ALU_OUT_tb==16'b0& !Arith_flag_tb & !Logic_flag_tb&!CMP_flag_tb&!Shift_flag_tb)
$display ("TEST CASE 16 is Passed") ;
else
$display ("TEST CASE 16 is Failed") ;
#5000
$finish ;
end

//Clock Generator

`timescale 1ns/1ps 
always #5000 CLK_tb=~CLK_tb ;

//DUT instantiation

ALU DUT (
.A(A_tb),
.B(B_tb),
.ALU_FUN(ALU_FUN_tb),
.CLK(CLK_tb),
.ALU_OUT(ALU_OUT_tb),
.Arith_flag(Arith_flag_tb),
.Logic_flag(Logic_flag_tb),
.CMP_flag(CMP_flag_tb),
.Shift_flag(Shift_flag_tb) 
);

endmodule