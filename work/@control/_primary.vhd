library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        Op_i            : in     vl_logic_vector(5 downto 0);
        RegDst_o        : out    vl_logic;
        ALUOp_o         : out    vl_logic_vector(2 downto 0);
        ALUSrc_o        : out    vl_logic;
        RegWrite_o      : out    vl_logic
    );
end Control;
