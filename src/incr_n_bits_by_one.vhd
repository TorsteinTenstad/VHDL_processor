library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity incr_n_bits_by_one is
    Generic(n : integer := 8);
    Port ( input : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           overflow_flag : out STD_LOGIC);
end incr_n_bits_by_one;

architecture Behavioral of incr_n_bits_by_one is

component incr_bit_by_one is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

signal carry_sig : STD_LOGIC_VECTOR (n downto 0);

begin

carry_sig(0) <= '1';

GEN : for i in 0 to n-1 generate
    incr_bit_by_one_inst : incr_bit_by_one
    port map(input     => input(i),
             output    => output(i), 
             carry_in  => carry_sig(i),
             carry_out => carry_sig(i+1)
             );
end generate GEN;

overflow_flag <= carry_sig(n);

end Behavioral;
