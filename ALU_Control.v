module ALU_Control
(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input [5:0] funct_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;

reg [2:0] tmp_ALUCtrl;
assign ALUCtrl_o = tmp_ALUCtrl;

always @(funct_i or ALUOp_i) begin
    case (ALUOp_i)
        2'b00: tmp_ALUCtrl = 3'b010; // add for lw, sw, addi
        2'b01: tmp_ALUCtrl = 3'b110; // sub
        2'b10: tmp_ALUCtrl = 3'b001; // or
        default :
            case (funct_i)
                6'b100000: tmp_ALUCtrl = 3'b010; // add
                6'b100010: tmp_ALUCtrl = 3'b110; // sub
                6'b100100: tmp_ALUCtrl = 3'b000; // and
                6'b100101: tmp_ALUCtrl = 3'b001; // or
                6'b101010: tmp_ALUCtrl = 3'b111; // set on less
                6'b011000: tmp_ALUCtrl = 3'b100; // mul
                default : tmp_ALUCtrl = 3'bxxx;
            endcase
    endcase
end

endmodule
