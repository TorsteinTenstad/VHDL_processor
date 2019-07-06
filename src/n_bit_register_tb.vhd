library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_register_tb is
    Generic(n : integer := 8);
end n_bit_register_tb;



architecture Behavioral of n_bit_register_tb is

component n_bit_register is
    Generic(n : integer := 8);
    Port (clk : in STD_LOGIC;
          input : in STD_LOGIC_VECTOR (n-1 downto 0);
          data : out STD_LOGIC_VECTOR (n-1 downto 0);
          output : out STD_LOGIC_VECTOR (n-1 downto 0);
          write_enable : in STD_LOGIC;
          output_enable : in STD_LOGIC;
          clear : in STD_LOGIC);
end component;

signal clk : STD_LOGIC := '0';
signal input : STD_LOGIC_VECTOR (n-1 downto 0) := "00000000";
signal data : STD_LOGIC_VECTOR (n-1 downto 0);
signal output : STD_LOGIC_VECTOR (n-1 downto 0);
signal write_enable : STD_LOGIC := '0';
signal output_enable : STD_LOGIC := '0';
signal clear : STD_LOGIC := '0';

begin

UUT : n_bit_register
    generic map(n => n)
    port map(clk           => clk, 
             input         => input, 
             data          => data, 
             output        => output,
             write_enable  => write_enable,
             output_enable => output_enable,
             clear         => clear);

CLK_GEN : process is
begin
    wait for 0.1 ns;
    clk <= not clk;
end process CLK_GEN;

process
begin
    wait for 1 ns;
    input <= "00101010";
    output_enable <= '1';
    wait for 1 ns;
    output_enable <= '0';
    wait for 1 ns;
    write_enable <= '1';
    wait for 1 ns;
    output_enable <= '1';
    wait for 1 ns;
    clear <= '1';
    wait for 1 ns;
    input <= "01011011";
    wait for 1 ns;
    clear <= '0';
    wait for 1 ns;
    write_enable <= '1';
    wait for 1 ns;
    output_enable <= '1';
end process;
end Behavioral;
