module ALU
(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

input [31:0] data1_i;
input [31:0] data2_i;
input [2:0] ALUCtrl_i;
output [31:0] data_o;
output Zero_o;

reg [31:0] tmp_out;
reg tmp_Zero;
assign data_o = tmp_out;
assign Zero_o = tmp_Zero;

always @(*) begin
    case (ALUCtrl_i)
        3'b000: tmp_out = data1_i & data2_i;
        3'b001: tmp_out = data1_i | data2_i;
        3'b010: tmp_out = data1_i + data2_i;
        //3'b011: ;
        3'b100: tmp_out = data1_i * data2_i;
        //3'b101: ;
        3'b110: tmp_out = data1_i - data2_i;
        //3'b111: tmp_out = (data1_i < data2_i) ? 1 : 0;
        default: tmp_out = data1_i;
    endcase
    tmp_Zero = (tmp_out == 0) ? 1 : 0;
end

endmodule
