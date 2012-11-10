module Control
(
    Op_i,
    RegDst_o,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

input [5:0] Op_i;
output RegDst_o;
//output [2:0] ALUOp_o;
output [1:0] ALUOp_o;
output ALUSrc_o;
output RegWrite_o;

reg RType, ori, lw, sw, beq, jump, mul;
reg addi;
reg tmp_RegDst, tmp_ALUSrc, tmp_RegWrite;
reg [1:0] tmp_ALUOp;
assign RegDst_o = tmp_RegDst;
assign ALUOp_o = tmp_ALUOp;
assign ALUSrc_o = tmp_ALUSrc;
assign RegWrite_o = tmp_RegWrite;

always @(Op_i) begin
    RType = ~Op_i[5] & ~Op_i[4] & ~Op_i[3] & ~Op_i[2] & ~Op_i[1] & ~Op_i[0];
    ori = ~Op_i[5] & ~Op_i[4] & Op_i[3] & Op_i[2] & ~Op_i[1] & Op_i[0];
    lw = Op_i[5] & ~Op_i[4] & ~Op_i[3] & ~Op_i[2] & Op_i[1] & Op_i[0];
    sw = Op_i[5] & ~Op_i[4] & Op_i[3] & ~Op_i[2] & Op_i[1] & Op_i[0];
    beq = ~Op_i[5] & ~Op_i[4] & ~Op_i[3] & Op_i[2] & ~Op_i[1] & ~Op_i[0];
    jump = ~Op_i[5] & ~Op_i[4] & ~Op_i[3] & ~Op_i[2] & Op_i[1] & ~Op_i[0];

    addi = ~Op_i[5] & ~Op_i[4] & Op_i[3] & ~Op_i[2] & ~Op_i[1] & ~Op_i[0];
    mul = ~Op_i[5] & Op_i[4] & Op_i[3] & ~Op_i[2] & ~Op_i[1] & ~Op_i[0];

    tmp_RegDst = RType;
    //tmp_RegWrite = RType | ori | lw;
    tmp_RegWrite = RType | ori | lw | addi;
    //tmp_ALUSrc = ori | lw | sw;
    tmp_ALUSrc = ori | lw | sw | addi;
    //tmp_ALUOp[2] = RType;
    tmp_ALUOp[1] = RType | ori;
    tmp_ALUOp[0] = RType | beq;

end


endmodule