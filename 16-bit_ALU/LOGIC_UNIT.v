module LOGIC_UNIT #(parameter WIDTH=16)
(
 input wire        [WIDTH-1:0]     A,B,
 input wire                              Clk,Logic_Enable, RST,
 input wire        [1:0]               Logic_FUN,
 output reg       [WIDTH-1:0]     Logic_OUT,
 output reg                             Logic_Flag
);

reg                 [WIDTH-1:0]      Logic_comb;
reg                                        Logic_Flag_comb;

always @(posedge Clk or negedge RST)
 begin
  if(!RST)
   begin
     Logic_OUT<='b0;
     Logic_Flag<=1'b0 ;	 
   end
  else 
   begin
    Logic_OUT<=Logic_comb;
	Logic_Flag<=Logic_Flag_comb ;
   end
 end
 
always @(*)
 begin
  if(Logic_Enable)
   begin
    Logic_Flag_comb=1'b1 ;
    case (Logic_FUN)
     2'b00 : Logic_comb=A&B ;
     2'b01 : Logic_comb=A|B ;
     2'b10 : Logic_comb=~(A&B); 
     2'b11 : Logic_comb=~(A|B) ;
     default : Logic_comb='b0 ;
    endcase
   end              
  else
   begin
    Logic_comb='b0 ; 
    Logic_Flag_comb=1'b0;	
   end   
 end
 
endmodule