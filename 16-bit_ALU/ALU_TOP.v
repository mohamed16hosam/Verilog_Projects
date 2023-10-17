module ALU_TOP #(parameter WIDTH=16)
(
 input wire      [WIDTH-1:0]      A,B,
 input wire      [3:0]                ALU_FUN,
 input wire                             Clk,RST,
 output wire    [WIDTH-1:0]      Arith_OUT,Logic_OUT,CMP_OUT,SHIFT_OUT,
 output wire                           Carry_OUT,Arith_Flag,Logic_Flag,CMP_Flag,SHIFT_Flag   
);

wire                                      Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable;

Decoder_UNIT U_Decoder (
.ALU_FUN(ALU_FUN[3:2]),
.Arith_Enable(Arith_Enable), 
.Logic_Enable(Logic_Enable), 
.CMP_Enable(CMP_Enable), 
.Shift_Enable(Shift_Enable)
);

ARITHMETIC_UNIT U_Arithmetic (
.A(A), 
.B(B), 
.Clk(Clk), 
.Arith_Enable(Arith_Enable), 
.Arith_FUN(ALU_FUN[1:0]), 
.Arith_OUT(Arith_OUT), 
.Carry_OUT(Carry_OUT), 
.Arith_Flag(Arith_Flag),
.RST(RST)
);

LOGIC_UNIT U_Logic (
.A(A), 
.B(B), 
.Clk(Clk), 
.Logic_Enable(Logic_Enable), 
.Logic_FUN(ALU_FUN[1:0]), 
.Logic_OUT(Logic_OUT), 
.Logic_Flag(Logic_Flag),
.RST(RST)
);

CMP_UNIT U_CMP (
.A(A), 
.B(B), 
.Clk(Clk), 
.CMP_Enable(CMP_Enable), 
.CMP_FUN(ALU_FUN[1:0]), 
.CMP_OUT(CMP_OUT), 
.CMP_Flag(CMP_Flag),
.RST(RST)
);

SHIFT_UNIT U_Shift (
.A(A), 
.B(B), 
.Clk(Clk), 
.Shift_Enable(Shift_Enable), 
.Shift_FUN(ALU_FUN[1:0]), 
.Shift_OUT(SHIFT_OUT), 
.Shift_Flag(SHIFT_Flag),
.RST(RST)
);

endmodule