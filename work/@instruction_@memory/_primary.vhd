library verilog;
use verilog.vl_types.all;
entity Instruction_Memory is
    port(
        addr_i          : in     vl_logic_vector(31 downto 0);
        instr_o         : out    vl_logic_vector(31 downto 0)
    );
end Instruction_Memory;
