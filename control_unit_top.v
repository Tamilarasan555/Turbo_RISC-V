
module control_unit_top( op, zero, imm_src, reg_write, alu_src, mem_write, result_src, pc_src, branch, funct3, funct7, alu_control);

	input [6:0] op, funct7;
	input [2:0] funct3;
	input zero;
   
	output reg_write, alu_src, mem_write, branch, pc_src;
	output [1:0] imm_src, result_src;
	output [2:0] alu_control;
	
	wire [1:0] alu_op;

   
  
// Instantiating main_decoder module
  main_decoder main_decoder1(
    .op (op),
    .zero (zero),
    .pc_src (pc_src),
    .result_src (result_src),
    .mem_write (mem_write),
    .alu_src (alu_src),
    .imm_src (imm_src),
    .branch (branch),
    .reg_write (reg_write),
    .alu_op (alu_op)
  );

 
// Instantiate alu_decoder module
  alu_decoder alu_decoder1(
    .funct7 (funct7),
    .funct3 (funct3),
    .alu_op (alu_op),
    .alu_control (alu_control)
  );

endmodule
