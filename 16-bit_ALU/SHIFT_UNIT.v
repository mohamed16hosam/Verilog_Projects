module SHIFT_UNIT #(parameter WIDTH=16)
(
 input wire        [WIDTH-1:0]     A,B,
 input wire                              Clk,Shift_Enable,RST,
 input wire        [1:0]               Shift_FUN,
 output reg       [WIDTH-1:0]     Shift_OUT,
 output reg                             Shift_Flag
);

reg                 [WIDTH-1:0]      Shift_comb;
reg                                        Shift_Flag_comb;

always @(posedge Clk or negedge RST)
 begin
  if(!RST)
   begin
     Shift_OUT<='b0;
     Shift_Flag<=1'b0 ;	 
   end
  else 
   begin
    Shift_OUT<=Shift_comb;
	Shift_Flag<=Shift_Flag_comb ;
   end
 end
 
always @(*)
 begin
  if(Shift_Enable)
   begin
    Shift_Flag_comb=1'b1 ;
    case (Shift_FUN)
     2'b00 : Shift_comb=A>>1 ;
     2'b01 : Shift_comb=A<<1 ;
     2'b10 : Shift_comb=B>>1 ;
     2'b11 : Shift_comb=B<<1 ;
     default : Shift_comb='b0 ;
    endcase
   end           
  else
   begin
    Shift_comb='b0 ; 
    Shift_Flag_comb=1'b0;	
   end   
 end
 
endmodule