module extent ( imm_ext, imm, imm_scr);

output [31:0] imm_ext;
input [31:0] imm;
input reg [2:0] imm_scr;


always @ (*) begin

	case(immsrc)
	   3'b000 : immext = {20{imm[31]},imm[31:20]}; // I - Type
	   3'b001 : immext = {20{imm[31]},imm[31:25],imm[11:7]}; // S - Type
	   3'b011 : immext = {20{imm[31]},imm[7],imm[30:25], imm[11:8], 1'b0}; // B - Type
	   3'b100 : immext = {12{imm[31],imm[19:12], imm[20], imm[30:25], imm[24:21], 1'b0}; // J - Type
	   3'b101 : immext = {imm[31:12], 12'b_0000_0000_0000}; // U - Type
	   default : immext = 32'hx;
	endcase
end

endmodule
