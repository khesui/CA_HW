module MUX5
(
    data1_i,
    data2_i,
    select_i,
    data_o
);

input [5:0] data1_i;
input [5:0] data2_i;
input select_i;
output [5:0] data_o;

reg [5:0] tmp_out;
assign data_o = tmp_out;

always @(data1_i or data2_i or select_i) begin
    case (select_i)
        0: tmp_out = data1_i; // Rt 20~16
        1: tmp_out = data2_i; // Rd 15~11
        default : tmp_out = 6'b000000;
    endcase
end

endmodule