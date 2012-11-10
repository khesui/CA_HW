library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        data1_i         : in     vl_logic_vector(31 downto 0);
        data2_i         : in     vl_logic_vector(31 downto 0);
        ALUCtrl_i       : in     vl_logic_vector(2 downto 0);
        data_o          : out    vl_logic_vector(31 downto 0);
        Zero_o          : out    vl_logic
    );
end ALU;
