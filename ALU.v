`timescale 1 ns/1 ns

module alu (src_a, src_b, c, data_out);
input [7:0] src_a, src_b;
input [2:0] c;
output [7:0] data_out;
wire [7:0] data_out;

reg [7:0] tmp_out;
assign data_out = tmp_out;
always @(*) begin
   case (c)
      3'b001: tmp_out = src_a + src_b;
      3'b010: tmp_out = src_a - src_b;
      3'b011: tmp_out = src_a & src_b;
      3'b100: tmp_out = src_a | src_b;
      3'b101: tmp_out = src_a ^ src_b;
      default: tmp_out = src_a;
   endcase
end

endmodule
