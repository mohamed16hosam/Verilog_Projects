module Up_Dn_Counter (
input wire [4:0] IN,
input wire Load,
input wire Up,
input wire Down,
input wire clk,
output reg [4:0] counter,
output wire High,
output wire Low
);
always @(posedge clk)
begin
if(Load)
begin
counter<=IN;
end
else if(Down&!Low)
begin
counter<=counter-5'b1;
end
else if(Up&!High)
begin
counter<=counter+5'b1;
end
end
assign High=(counter==5'b11111);
assign Low=(counter==5'b0);
endmodule