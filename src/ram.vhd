library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity ram is
    Generic(width : integer := 8;
            addr_size : integer := 8);
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           data_in : in STD_LOGIC_VECTOR (width-1 downto 0);
           write_en : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (width-1 downto 0));
end ram;

architecture Behavioral of ram is

type RAM_ARRAY is array (0 to addr_size-1) of STD_LOGIC_VECTOR (width-1 downto 0);

signal RAM : RAM_ARRAY := (others => (width-1 downto 0 => '0'));

begin
process(clk)
begin
    if (rising_edge(clk)) then
        if(write_en = '1') then
            RAM(to_integer(unsigned(addr))) <= data_in;
        end if;
    end if;
end process;

data_out <= RAM(to_integer(unsigned(addr)));

end Behavioral;
