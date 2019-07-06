library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_mux is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           output : out STD_LOGIC;
           sel : in STD_LOGIC);
end one_bit_mux;

architecture Behavioral of one_bit_mux is

begin

output <= A when (sel = '0') else B;

end Behavioral;
