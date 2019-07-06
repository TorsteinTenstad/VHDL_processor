library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_adder is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           sum : out STD_LOGIC_VECTOR (n-1 downto 0);
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end n_bit_adder;

architecture Behavioral of n_bit_adder is

component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

signal carry_sig : STD_LOGIC_VECTOR (n downto 0);

begin

carry_sig(0) <= carry_in;
carry_out <= carry_sig(n);

GEN : for i in 0 to n-1 generate
    full_adder_inst : full_adder
    port map(A         => A(i),
             B         => B(i), 
             sum       => sum(i), 
             carry_in  => carry_sig(i),
             carry_out => carry_sig(i+1));
       
end generate GEN;

end Behavioral;
