library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        src_a           : in     vl_logic_vector(7 downto 0);
        src_b           : in     vl_logic_vector(7 downto 0);
        c               : in     vl_logic_vector(2 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end alu;
