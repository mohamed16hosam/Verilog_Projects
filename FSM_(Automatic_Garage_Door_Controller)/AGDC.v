module AGDC (
 input wire           UP_Max,DN_Max,Activate,CLK,RST,
 output reg          UP_M,DN_M
);

reg       [1:0]        current_state, next_state ;

localparam          IDLE=2'b00 ,
                          Mv_Dn=2'b01 ,
						  Mv_Up=2'b11 ;

always @(posedge CLK or negedge RST)
 begin
     if (!RST)
	  begin
	     current_state<=IDLE ;
	  end
	  
	 else
	  begin
	     current_state<=next_state ;
	  end
	  
 end						  
 
always @(*)
 begin
     UP_M=1'b0 ;
     DN_M=1'b0 ;

	 case (current_state)
	 IDLE : begin
	           if (Activate)
	            begin
	             if(UP_Max & ! DN_Max)		   
			      begin
				     next_state=Mv_Dn ;
				  end
				  
				 else if (DN_Max & ! UP_Max)
				  begin
				     next_state=Mv_Up ;
				  end
				 
				 else next_state=IDLE ;
				 
			    end
			   
			   else next_state=IDLE ;
			  end

	 Mv_Dn : begin
	              
				  UP_M=1'b0 ;
				  DN_M=1'b1 ;
				  
				  if (DN_Max & ! UP_Max)
	               begin
				     next_state=IDLE ;
				   end
				  
				  else if (UP_Max & ! DN_Max)
				   begin
				     next_state=Mv_Dn ;
				   end
	 
	              else next_state=IDLE ;
				 end
	 
	 Mv_Up : begin if (! DN_Max &  UP_Max)
	                       begin
				             next_state=IDLE ;
				           end
				  
				          else if (! UP_Max &  DN_Max)
				            begin
				             next_state=Mv_Up ;
					         UP_M=1'b1 ;
					         DN_M=1'b0 ;
				            end
	 
	                      else next_state=IDLE ;
						  
						  UP_M=1'b1 ;
						  DN_M=1'b0 ;
				 end
				 
	 default : begin
                     UP_M=1'b0 ;
                     DN_M=1'b0 ;
					 next_state=IDLE ;
				  end	 
	 
	 endcase
 end

endmodule