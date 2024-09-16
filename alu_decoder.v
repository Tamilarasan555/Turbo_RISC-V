module alu_decoder (
  input [6:0]funct7,
  input [2:0] funct3,
  input [1:0] alu_op,
  output reg [2:0] alu_control
); 
  
  always @(*) begin
    
    if (alu_op == 2'b00) begin
      alu_control <= 3'b000;
    end
    
    else if (alu_op == 2'b01) begin
      alu_control <= 3'b001;  
    end
    
    else if (alu_op == 2'b10) begin
	 
               if (funct3 == 3'b000) begin
                   if (funct7 == 7'b0000001) begin alu_control <= 3'b100;  end //multip
							else if (funct7 == 7'b00000) begin alu_control <= 3'b000;  end //add
								else if (funct7 == 7'b0100000) begin alu_control <= 3'b001;  end //sub
									else begin alu_control<=3'b000; end
                end
      
                else if (funct3 == 3'b010) begin alu_control <= 3'b101; end
      
                else if (funct3 == 3'b110) begin alu_control <= 3'b011; end
      
                else if (funct3 == 3'b111) begin alu_control <= 3'b010; end
      
                else begin alu_control <= 3'b000; end
      
    end
    
    else begin   alu_control <= 3'b000; end
  
  end
  
endmodule
