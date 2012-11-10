library verilog;
use verilog.vl_types.all;
entity ALU_Control is
    port(
        funct_i         : in     vl_logic_vector(5 downto 0);
        ALUOp_i         : in     vl_logic_vector(1 downto 0);
        ALUCtrl_o       : out    vl_logic_vector(2 downto 0)
    );
end ALU_Control;
