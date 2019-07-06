library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_inverter is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC);
end one_bit_inverter;

architecture Behavioral of one_bit_inverter is

begin

output <= not input;

end Behavioral;
