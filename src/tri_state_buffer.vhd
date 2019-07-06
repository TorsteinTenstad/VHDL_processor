library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           enable : in STD_LOGIC);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin

output <= input when (enable = '0') else 'Z';

end Behavioral;