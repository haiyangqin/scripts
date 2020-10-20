//---------------------------------------
always_ff@(posedge clk or negedge rstn) begin
  if (~rstn) begin
    xx_xx <= 1'b0;
  end
  else if (xxx) begin
    xx_xx <= 1'b0
  end
  else begin
    xx_xx <= 1'b1;
  end
end
//---------------------------------------
