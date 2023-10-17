module ALU (
input wire [15:0] A,B,
input wire [3:0] ALU_FUN,
input wire CLK,
output reg [15:0] ALU_OUT,
output reg Arith_flag,Logic_flag,CMP_flag,Shift_flag
);
always @ (posedge CLK)
begin
case (ALU_FUN)
4'b0000 : begin
ALU_OUT<=A+B ;
Arith_flag<=1 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0001 : begin
ALU_OUT<=A-B ;
Arith_flag<=1 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0010 : begin
ALU_OUT<=A*B ;
Arith_flag<=1 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0011 : begin
ALU_OUT<=A/B ;
Arith_flag<=1 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0100 : begin
ALU_OUT<=A&B ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0101 : begin
ALU_OUT<=A|B ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0110 : begin
ALU_OUT<=~(A&B) ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b0111 : begin
ALU_OUT<=~(A|B) ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b1000 : begin
ALU_OUT<=A^B ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b1001 : begin
ALU_OUT<=~(A^B) ;
Arith_flag<=0 ;
Logic_flag<=1 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
4'b1010 : begin
if (A==B)
begin
ALU_OUT<=16'b1 ;
end
else
begin
ALU_OUT<=16'b0 ;
end
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=1 ;
Shift_flag<=0 ; 
end
4'b1011 : begin
if (A>B)
begin
ALU_OUT<=16'b10 ;
end
else
begin
ALU_OUT<=16'b0 ;
end
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=1 ;
Shift_flag<=0 ; 
end
4'b1100 : begin
if (A<B)
begin
ALU_OUT<=16'b11 ;
end
else
begin
ALU_OUT<=16'b0 ;
end
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=1 ;
Shift_flag<=0 ; 
end
4'b1101 : begin
ALU_OUT<=A>>1 ;
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=1 ; 
end
4'b1110 : begin
ALU_OUT<=A<<1 ;
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=1 ; 
end
default : begin
ALU_OUT<=16'b0 ;
Arith_flag<=0 ;
Logic_flag<=0 ;
CMP_flag<=0 ;
Shift_flag<=0 ; 
end
endcase
end
endmodule
