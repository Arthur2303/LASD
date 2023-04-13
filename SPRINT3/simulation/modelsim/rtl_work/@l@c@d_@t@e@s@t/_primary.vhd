library verilog;
use verilog.vl_types.all;
entity LCD_TEST is
    generic(
        LCD_INTIAL      : integer := 0;
        LCD_RESTART     : integer := 4;
        LCD_LINE1       : integer := 5;
        LCD_CH_LINE     : vl_notype;
        LCD_LINE2       : vl_notype;
        LUT_SIZE        : vl_notype
    );
    port(
        iCLK            : in     vl_logic;
        iRST_N          : in     vl_logic;
        d0x0            : in     vl_logic_vector(7 downto 0);
        d0x1            : in     vl_logic_vector(7 downto 0);
        d0x2            : in     vl_logic_vector(7 downto 0);
        d0x3            : in     vl_logic_vector(7 downto 0);
        d0x4            : in     vl_logic_vector(7 downto 0);
        d0x5            : in     vl_logic_vector(7 downto 0);
        d1x0            : in     vl_logic_vector(7 downto 0);
        d1x1            : in     vl_logic_vector(7 downto 0);
        d1x2            : in     vl_logic_vector(7 downto 0);
        d1x3            : in     vl_logic_vector(7 downto 0);
        d1x4            : in     vl_logic_vector(7 downto 0);
        d1x5            : in     vl_logic_vector(7 downto 0);
        LCD_DATA        : out    vl_logic_vector(7 downto 0);
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_RS          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LCD_INTIAL : constant is 1;
    attribute mti_svvh_generic_type of LCD_RESTART : constant is 1;
    attribute mti_svvh_generic_type of LCD_LINE1 : constant is 1;
    attribute mti_svvh_generic_type of LCD_CH_LINE : constant is 3;
    attribute mti_svvh_generic_type of LCD_LINE2 : constant is 3;
    attribute mti_svvh_generic_type of LUT_SIZE : constant is 3;
end LCD_TEST;
