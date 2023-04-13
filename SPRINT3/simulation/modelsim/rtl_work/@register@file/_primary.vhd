library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    generic(
        N               : integer := 8
    );
    port(
        wd3             : in     vl_logic_vector;
        wa3             : in     vl_logic_vector(2 downto 0);
        ra1             : in     vl_logic_vector(2 downto 0);
        ra2             : in     vl_logic_vector(2 downto 0);
        we3             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd1             : out    vl_logic_vector;
        rd2             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end RegisterFile;
