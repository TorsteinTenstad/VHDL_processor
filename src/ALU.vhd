library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           subtract_enable : in STD_LOGIC;
           overflow_flag : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component n_bit_adder is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           sum : out STD_LOGIC_VECTOR (n-1 downto 0);
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end component;

component n_bit_xor is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

signal xor_output : STD_LOGIC_VECTOR (n-1 downto 0);
signal subtract_enable_sig : STD_LOGIC_VECTOR (n-1 downto 0);

begin

process(subtract_enable)
begin
    for i in n-1 downto 0 loop
        subtract_enable_sig(i) <= subtract_enable;
    end loop;
end process;

n_bit_xor_inst : n_bit_xor
    generic map(n => n)
    port map(A => B,
             B => subtract_enable_sig,
             output => xor_output
             );

n_bit_adder_inst : n_bit_adder
    generic map(n => n)
    port map(A => A,
             B => xor_output,
             sum => output, 
             carry_in => subtract_enable,
             carry_out => overflow_flag
             );

end Behavioral;
