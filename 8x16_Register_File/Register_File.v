module Register_File (
input wire           [15:0]           WrData,
input wire           [2:0]             Address,
input wire                               WrEn,RdEn,CLK,RST,
output reg          [15:0]            RdData
);

reg                     [15:0]            regfile        [7:0] ;  
integer                                    i ;       

always @(posedge CLK or negedge RST)
     begin
	     if(!RST)
		     begin
			    RdData<=16'b0 ;
				for(i=0; i<8; i=i+1)
				 begin
				    regfile[i]<=16'b0 ;
				 end
			 end
	     else if(WrEn & !RdEn)
		     begin
			     regfile[Address]<=WrData ;
			 end
		 else if(RdEn & !WrEn)
		     begin
			     RdData<=regfile[Address] ;
			 end
	 end

endmodule