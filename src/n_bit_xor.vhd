library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_xor is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0));
end n_bit_xor;

architecture Behavioral of n_bit_xor is

begin
    process(A,B)
    begin
        for i in n-1 downto 0 loop
            output(i) <= A(i) xor B(i);
        end loop;
    end process;
end Behavioral;
