module LFSR (
 input wire                            RST,CLK,
 input wire             [3:0]        seed,
 output reg                           OUT,valid
);

reg                       [3:0]        LFSR,counter;
wire                                    count_flag;
integer                                i ;

assign count_flag=(counter==4'd8) ? 1'b1:1'b0 ;

always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    LFSR<=seed ;
    counter<=4'b0 ;
	valid<=1'b0 ;
  end
  else if(counter<4'd8)
   begin
    valid<=1'b0 ;
	counter<=counter+1'b1 ;
    LFSR[3]<=^LFSR[2:0] ;
    for(i=2;i>=0;i=i-1)
     begin
      LFSR[i]<=LFSR[i+1] ;
     end 
   end
  else
   begin
    valid<=1'b1 ;
	{LFSR[2:0],OUT}<=LFSR ;
   end
end

endmodule