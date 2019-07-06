library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_inverter is
    Generic(n : integer := 8);
    Port ( input : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0));
end n_bit_inverter;

architecture Behavioral of n_bit_inverter is

component one_bit_inverter is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

begin

GEN : for i in 0 to n-1 generate
    one_bit_inverter_inst : one_bit_inverter
    port map(input  => input(i),
             output => output(i)
             );
end generate GEN;

end Behavioral;