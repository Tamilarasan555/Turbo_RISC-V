module main_decoder(op, zero, pc_src, result_src, mem_write, alu_src, imm_src, branch, reg_write, alu_op);
	input zero;
   input [6:0] op;
   
	output   pc_src;
   output reg mem_write, alu_src, reg_write;
   output reg [1:0] result_src;
   output reg [1:0] imm_src;  
   output reg [1:0] alu_op;
   output reg branch;
   
	reg jump;
  
  always@(*)begin
    
    if(op == 7'b0000011) begin // lw I type
      reg_write <= 1'b1;
      imm_src <= 2'b00;
      alu_src <= 1'b1;
      mem_write <= 1'b0;
      result_src <= 2'b01;
      branch <= 1'b0;
      alu_op <= 2'b00;
      jump <= 1'b0;
    // pcsrc <= 1'b0;
    end
    
    else if(op == 7'b0100011)begin //S type 
      reg_write <= 1'b0;
      imm_src <= 2'b01;
      alu_src <= 1'b1;
      mem_write <= 1'b1;
      result_src <= 2'b00;
      branch <= 1'b0;
      alu_op <= 2'b00;
      jump <= 1'b0;
   //   pcsrc<=1'b0;
    end
    
    else if(op == 7'b0110011)begin //R type
      reg_write <= 1'b1;
      imm_src <= 2'b00;
      alu_src <= 1'b0;
      mem_write <= 1'b0;
      result_src <= 2'b00;
      branch <= 1'b0;
      alu_op <= 2'b10;
      jump <= 1'b0;
    //  pc_src<=1'b0;
    end
    
    else if(op == 7'b1100011)begin  //branch if equal
      reg_write <= 1'b0;
      imm_src <= 2'b10;
      alu_src <= 1'b0;
      mem_write <= 1'b0;
      result_src <= 2'b00;
      branch <= 1'b1;
      alu_op <= 2'b01;
      jump <= 1'b0;
  //    pcsrc <= 1'b1;
    end
    
    else if(op == 7'b0010011) begin //I type addi
      reg_write <= 1'b1;
      imm_src <= 2'b00;
      alu_src <= 1'b1;
      mem_write <= 1'b0;
      result_src <= 2'b00;
      branch <= 1'b0;
      alu_op <= 2'b00;
      jump <= 1'b0;
   //   pcsrc <= 1'b0;
     end   
    
    
    else if(op == 7'b1101111) begin //jump instruction
      reg_write <= 1'b1;
      imm_src <= 2'b11;
      alu_src <= 1'b1;
      mem_write <= 1'b0;
      result_src <= 2'b10;
      branch <= 1'b0;
      alu_op <= 2'b00;
      jump <= 1'b1;
    //  pc_src <= 1'b1;
     end   
    
    else begin
      reg_write <= 1'b0;
      imm_src <= 2'b00;
      alu_src <= 1'b0;
      mem_write <= 1'b0;
      result_src <= 2'b00;
      branch <=1'b0;
      alu_op <= 2'b00;
      jump <= 1'b0;
  //    pc_src <= 1'b0;
    end
    
  end
  
  assign pc_src=((zero & branch)|jump);
  
endmodule
