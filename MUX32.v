module MUX32
(
    data1_i,
    data2_i,
    select_i,
    data_o
);

input [31:0] data1_i;
input [31:0] data2_i;
input select_i;
output [31:0] data_o;

reg [31:0] tmp_out;
assign data_o = tmp_out;

always @(data1_i or data2_i or select_i) begin
    case (select_i)
        0: tmp_out = data1_i; // Reg
        1: tmp_out = data2_i; // Imm
        default : tmp_out = 0;
    endcase
end

endmodule
