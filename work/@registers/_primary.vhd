library verilog;
use verilog.vl_types.all;
entity Registers is
    port(
        clk_i           : in     vl_logic;
        RSaddr_i        : in     vl_logic_vector(4 downto 0);
        RTaddr_i        : in     vl_logic_vector(4 downto 0);
        RDaddr_i        : in     vl_logic_vector(4 downto 0);
        RDdata_i        : in     vl_logic_vector(31 downto 0);
        RegWrite_i      : in     vl_logic;
        RSdata_o        : out    vl_logic_vector(31 downto 0);
        RTdata_o        : out    vl_logic_vector(31 downto 0)
    );
end Registers;
