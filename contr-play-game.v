module contr_play_game(vga_clk,resetn,key_move,addr_x,addr_y,vga_r1,vga_g1,vga_b1);
parameter RESOLUTION = "160x120";

input vga_clk;
input resetn;
input key_move;
input [((RESOLUTION == "320x240") ? (8) : (7)):0] addr_x; 
input [((RESOLUTION == "320x240") ? (7) : (6)):0] addr_y;	
output [9:0] vga_r1;
output [9:0] vga_g1;
output [9:0] vga_b1;


reg [23:0] key_move_v =24'hffffff;
reg move_sig =1'b0;

reg[6:0] row_data_h0 =7'd9;
reg[6:0] row_data_l0 =7'd0;

reg[6:0] row_data_h1 =7'd69;
reg[6:0] row_data_l1 =7'd60;

reg[6:0] row_data_h2 =7'd49;
reg[6:0] row_data_l2 =7'd40;

reg[6:0] row_data_h3 =7'd109;
reg[6:0] row_data_l3 =7'd100;

reg [4:0] data_con =5'd0;
reg up_sig0 =1'b0 ;
reg up_sig1 =1'b0 ;
reg up_sig2 =1'b0 ;
reg up_sig3 =1'b0 ;
reg en_sig =1'b0;

reg [9:0] vga_r1r =10'd0;
reg [9:0] vga_g1r =10'd0;
reg [9:0] vga_b1r =10'd0;

reg [9:0] vga_r1rr =10'd0;
reg [9:0] vga_g1rr =10'd0;
reg [9:0] vga_b1rr =10'd0;

reg [7:0] targ_addr =8'd1;

reg hit_sig0 =1'b0;
reg hit_sig1 =1'b0;
reg hit_sig2 =1'b0;
reg hit_sig3 =1'b0;
reg hit_sig =1'b0;
always@(posedge vga_clk)
begin
  if(addr_x =='d1 && addr_y =='d0)
    data_con <= data_con +1'b1;
  else
    data_con <= data_con ;
end

always@(posedge vga_clk)
begin
  if(addr_x =='d1 && addr_y =='d0 && data_con ==5'd30) 
     en_sig <= 1'b1;
  else
     en_sig <= 1'b0; 
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1) begin
	  if(row_data_h0 ==7'd118 && up_sig0 ==1'b1)
	    up_sig0 <= 1'b0;
	  else if(row_data_h0 ==7'd10 & up_sig0 ==1'b0)
	    up_sig0 <= 1'b1;
	  else
	    up_sig0 <= up_sig0;
	end
	else
	  up_sig0 <= up_sig0;
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1 && up_sig0 ==1'b1) begin
	  row_data_h0 <= row_data_h0 +1'b1;
	  row_data_l0 <= row_data_l0 +1'b1;
	end
	else if(en_sig ==1'b1 && up_sig0 ==1'b0) begin
	  row_data_h0 <= row_data_h0 -1'b1;
	  row_data_l0 <= row_data_l0 -1'b1;
	end
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1) begin
	  if(row_data_h1 ==7'd118 && up_sig1 ==1'b1)
	    up_sig1 <= 1'b0;
	  else if(row_data_h1 ==7'd10 & up_sig1 ==1'b0)
	    up_sig1 <= 1'b1;
	  else
	    up_sig1 <= up_sig1;
	end
	else
	  up_sig1 <= up_sig1;
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1 && up_sig1 ==1'b1) begin
	  row_data_h1 <= row_data_h1 +1'b1;
	  row_data_l1 <= row_data_l1 +1'b1;
	end
	else if(en_sig ==1'b1 && up_sig1 ==1'b0) begin
	  row_data_h1 <= row_data_h1 -1'b1;
	  row_data_l1 <= row_data_l1 -1'b1;
	end
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1) begin
	  if(row_data_h2 ==7'd118 && up_sig2 ==1'b1)
	    up_sig2 <= 1'b0;
	  else if(row_data_h2 ==7'd10 & up_sig2 ==1'b0)
	    up_sig2 <= 1'b1;
	  else
	    up_sig2 <= up_sig2;
	end
	else
	  up_sig2 <= up_sig2;
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1 && up_sig2 ==1'b1) begin
	  row_data_h2 <= row_data_h2 +1'b1;
	  row_data_l2 <= row_data_l2 +1'b1;
	end
	else if(en_sig ==1'b1 && up_sig2 ==1'b0) begin
	  row_data_h2 <= row_data_h2 -1'b1;
	  row_data_l2 <= row_data_l2 -1'b1;
	end
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1) begin
	  if(row_data_h3 ==7'd118 && up_sig3 ==1'b1)
	    up_sig3 <= 1'b0;
	  else if(row_data_h3 ==7'd10 & up_sig3 ==1'b0)
	    up_sig3 <= 1'b1;
	  else
	    up_sig3 <= up_sig3;
	end
	else
	  up_sig3 <= up_sig3;
end

always@(posedge vga_clk)
begin
   if(en_sig ==1'b1 && up_sig3 ==1'b1) begin
	  row_data_h3 <= row_data_h3 +1'b1;
	  row_data_l3 <= row_data_l3 +1'b1;
	end
	else if(en_sig ==1'b1 && up_sig3 ==1'b0) begin
	  row_data_h3 <= row_data_h3 -1'b1;
	  row_data_l3 <= row_data_l3 -1'b1;
	end
end


reg col_sig =1'b0;
always@(posedge vga_clk)
begin
  if(((addr_x >='d34 && addr_x <='d36) || (addr_x >='d69 && addr_x <='d71)) || 
    ((addr_x >='d99 && addr_x <='d101) || (addr_x >='d129 && addr_x <='d131)))
	   col_sig <= 1'b1;
  else 
      col_sig <= 1'b0;
end

//hit_sig
always@(posedge vga_clk)
begin
  if(targ_addr >=8'd31 && targ_addr <=8'd36) begin
     if((row_data_h0 >=7'd58 && row_data_l0 <= 7'd58) ||(row_data_h0 >=7'd61 && row_data_l0 <=7'd61))
	    hit_sig0 <= 1'b1;
	  else
	    hit_sig0 <= 1'b0;
  end
  else
    hit_sig0 <= 1'b0;
end

always@(posedge vga_clk)
begin
  if(targ_addr >=8'd66 && targ_addr <=8'd71) begin
     if((row_data_h1 >=7'd58 && row_data_l1 <= 7'd58) ||(row_data_h1 >=7'd61 && row_data_l1 <=7'd61))
	    hit_sig1 <= 1'b1;
	  else
	    hit_sig1 <= 1'b0;
  end
  else
    hit_sig1 <= 1'b0;
end

always@(posedge vga_clk)
begin
  if(targ_addr >=8'd96 && targ_addr <=8'd101) begin
     if((row_data_h2 >=7'd58 && row_data_l2 <= 7'd58) ||(row_data_h2 >=7'd61 && row_data_l2 <=7'd61))
	    hit_sig2 <= 1'b1;
	  else
	    hit_sig2 <= 1'b0;
  end
  else
    hit_sig2 <= 1'b0;
end


always@(posedge vga_clk)
begin
  if(targ_addr >=8'd126 && targ_addr <=8'd131) begin
     if((row_data_h3 >=7'd58 && row_data_l3 <= 7'd58) ||(row_data_h3 >=7'd61 && row_data_l3 <=7'd61))
	    hit_sig3 <= 1'b1;
	  else
	    hit_sig3 <= 1'b0;
  end
  else
    hit_sig3 <= 1'b0;
end

always@(posedge vga_clk)
begin
  hit_sig <= (hit_sig0 | hit_sig1) | (hit_sig2 | hit_sig3);
end

always@(posedge vga_clk)
begin
  if(col_sig) begin
    if((addr_y <=row_data_h0 && addr_y >=row_data_l0) || (addr_y <=row_data_h1 && addr_y >=row_data_l1) || 
	    (addr_y <=row_data_h2 && addr_y >=row_data_l2) || (addr_y <=row_data_h3 && addr_y >=row_data_l3) ) begin
	   vga_r1r <= 10'd1000;
		vga_g1r <= 10'd3;
		vga_b1r <= 10'd10;
	 end
    else begin
	   vga_r1r <= 10'd0;
		vga_g1r <= 10'd0;
		vga_b1r <= 10'd0;
	 end
  end
end


always@(posedge vga_clk)
begin
  key_move_v <={key_move_v[22:0],key_move};
  if(key_move_v ==24'h800000)
    move_sig <= 1'b1;
  else
    move_sig <= 1'b0;
end

always@(posedge vga_clk)
begin
   if(!resetn)
	  targ_addr <= 8'd1;
	else if(hit_sig)
	  targ_addr <= 8'd1;
	else if(move_sig) begin
	  if(targ_addr >=8'd150)
	    targ_addr <= 8'd1;
	  else
	    targ_addr <= targ_addr +8'd4;
	end
end


always@(posedge vga_clk)
begin
  if(addr_y >='d58 && addr_y <='d61) begin
     if(addr_x >=targ_addr && addr_x <= targ_addr +8'd3) begin
	     vga_r1rr <= 10'd10;
		  vga_g1rr <= 10'd400;
		  vga_b1rr <= 10'd400;
     end	
	  else begin
	     vga_r1rr <= 10'd0;
		  vga_g1rr <= 10'd0;
		  vga_b1rr <= 10'd0;
     end	
  end
end

assign vga_r1 = vga_r1r | vga_r1rr;
assign vga_g1 = vga_g1r | vga_g1rr;
assign vga_b1 = vga_b1r | vga_b1rr;

endmodule
