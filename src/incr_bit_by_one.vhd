library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity incr_bit_by_one is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end incr_bit_by_one;

architecture Behavioral of incr_bit_by_one is

begin

output <= input xor carry_in;
carry_out <= input and carry_in;

end Behavioral;
