library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_mux is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in STD_LOGIC);
end n_bit_mux;

architecture Behavioral of n_bit_mux is

component one_bit_mux is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           output : out STD_LOGIC;
           sel : in STD_LOGIC);
end component;

begin

GEN : for i in 0 to n-1 generate
    one_bit_mux_inst : one_bit_mux
    port map(A      => A(i),
             B      => B(i), 
             output => output(i), 
             sel    => sel
             );
end generate GEN;

end Behavioral;
