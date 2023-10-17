module CMP_UNIT #(parameter WIDTH=16)
(
 input wire        [WIDTH-1:0]     A,B,
 input wire                              Clk,CMP_Enable,RST,
 input wire        [1:0]               CMP_FUN,
 output reg       [WIDTH-1:0]     CMP_OUT,
 output reg                             CMP_Flag
);

reg                 [WIDTH-1:0]      CMP_comb;
reg                                        CMP_Flag_comb;

always @(posedge Clk or negedge RST)
 begin
  if(!RST)
   begin
     CMP_OUT<='b0;
     CMP_Flag<=1'b0 ;	 
   end
  else 
   begin
    CMP_OUT<=CMP_comb;
	CMP_Flag<=CMP_Flag_comb ;
   end
 end
 
always @(*)
 begin
  if(CMP_Enable)
   begin
    CMP_Flag_comb=1'b1 ;
    case (CMP_FUN) 
     2'b01 : begin
	  if (A==B)
       begin
        CMP_comb='b1 ;
       end
      else
       begin
        CMP_comb='b0 ;
       end
	  end
	  
     2'b10 : begin
	  if (A>B)
       begin
        CMP_comb='b10 ;
       end
      else
       begin
        CMP_comb='b0 ;
       end
	  end
	  
     2'b11 : begin
	  if (A<B)
       begin
        CMP_comb='b11 ;
       end
      else
       begin
        CMP_comb='b0 ;
       end
	  end
	  
     default : CMP_comb='b0 ; 
    endcase
   end
  else
   begin
    CMP_comb='b0 ; 
    CMP_Flag_comb=1'b0;	
   end   
 end
 
endmodule