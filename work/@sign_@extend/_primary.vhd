library verilog;
use verilog.vl_types.all;
entity Sign_Extend is
    port(
        data_i          : in     vl_logic_vector(15 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0)
    );
end Sign_Extend;
