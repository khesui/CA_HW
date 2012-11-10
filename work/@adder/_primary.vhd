library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        data1_in        : in     vl_logic_vector(31 downto 0);
        data2_in        : in     vl_logic_vector(31 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0)
    );
end Adder;
