library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
    Generic(n : integer := 8);
end ALU_tb;

architecture Behavioral of ALU_tb is

component ALU is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           subtract_enable : in STD_LOGIC;
           overflow_flag : out STD_LOGIC);
end component;

signal A : STD_LOGIC_VECTOR (n-1 downto 0);
signal B : STD_LOGIC_VECTOR (n-1 downto 0);
signal output : STD_LOGIC_VECTOR (n-1 downto 0);
signal subtract_enable : STD_LOGIC := '0';
signal overflow_flag : STD_LOGIC;

begin

UUT : ALU
    generic map(n => n)
    port map(A => A, 
             B => B,
             output => output,
             subtract_enable => subtract_enable,
             overflow_flag => overflow_flag
             );
process
begin
    A <= "01101010";
    B <= "01011010";
    wait for 1 ns;
    subtract_enable <= '1';
    A <= "00100011";
    B <= "01111001";
    wait for 1 ns;
    subtract_enable <= '0';
    A <= "11111111";
    B <= "00000000";
    wait for 1 ns;
    subtract_enable <= '1';
    A <= "11111111";
    B <= "11111111";
    wait for 1 ns;
end process;

end Behavioral;
