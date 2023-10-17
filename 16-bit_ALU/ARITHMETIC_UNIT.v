module ARITHMETIC_UNIT #(parameter WIDTH=16)
(
 input wire        [WIDTH-1:0]     A,B,
 input wire                              Clk,Arith_Enable,RST,
 input wire        [1:0]               Arith_FUN,
 output reg       [WIDTH-1:0]     Arith_OUT,
 output reg                             Carry_OUT,Arith_Flag
);

reg                 [WIDTH-1:0]      Arith_comb;
reg                                        Arith_Carry;
reg                                        Arith_Flag_comb;

always @(posedge Clk or negedge RST)
 begin
  if(!RST)
   begin
     Arith_OUT<='b0;
     Arith_Flag<=1'b0 ;
     Carry_OUT<=1'b0;	 
   end
  else 
   begin
    Arith_OUT<=Arith_comb;
	Arith_Flag<=Arith_Flag_comb ;
	Carry_OUT<=Arith_Carry;
   end
 end
 
always @(*)
 begin
  if(Arith_Enable)
   begin
    Arith_Carry=1'b0;
    Arith_Flag_comb=1'b1 ;
    case (Arith_FUN)
     2'b00 : {Arith_Carry,Arith_comb}=A+B ;
     2'b01 : Arith_comb=A-B ;
     2'b10 : Arith_comb=A*B ;
     2'b11 : Arith_comb=A/B ;
     default : Arith_comb='b0; 
    endcase
   end             
  else
   begin
    Arith_comb='b0 ; 
    Arith_Carry=1'b0;
    Arith_Flag_comb=1'b0;	
   end   
 end
 
endmodule