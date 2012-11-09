library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        start_i         : in     vl_logic
    );
end CPU;
