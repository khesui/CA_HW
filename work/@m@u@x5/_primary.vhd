library verilog;
use verilog.vl_types.all;
entity MUX5 is
    port(
        data1_i         : in     vl_logic_vector(5 downto 0);
        data2_i         : in     vl_logic_vector(5 downto 0);
        select_i        : in     vl_logic;
        data_o          : out    vl_logic_vector(5 downto 0)
    );
end MUX5;
