library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter_tb is
    Generic(n : integer := 8);
end program_counter_tb;

architecture Behavioral of program_counter_tb is

component program_counter is
    Generic(n : integer := 8);
    Port ( clk : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           data : out STD_LOGIC_VECTOR (n-1 downto 0);
           data_out : out STD_LOGIC_VECTOR (n-1 downto 0);
           increment_enable : in STD_LOGIC;
           output_enable : in STD_LOGIC;
           write_enable : in STD_LOGIC;
           clear : in STD_LOGIC;
           overflow_flag : out STD_LOGIC);
end component;

signal clk : STD_LOGIC := '0';
signal data_in : STD_LOGIC_VECTOR (n-1 downto 0) := "00000000";
signal data : STD_LOGIC_VECTOR (n-1 downto 0);
signal data_out : STD_LOGIC_VECTOR (n-1 downto 0);
signal increment_enable : STD_LOGIC := '1';
signal output_enable : STD_LOGIC := '1';
signal write_enable : STD_LOGIC := '0';
signal clear : STD_LOGIC := '0';
signal overflow_flag : STD_LOGIC;

begin

UUT : program_counter
    generic map(n => n)
    port map(clk              => clk, 
             data_in          => data_in,
             data             => data, 
             data_out         => data_out,
             increment_enable => increment_enable,
             output_enable    => output_enable,
             write_enable     => write_enable,
             clear            => clear,
             overflow_flag    => overflow_flag
             );

CLK_GEN : process is
begin
    wait for 0.1 ns;
    clk <= not clk;
end process CLK_GEN;

process
begin
    wait for 1 ns;
    data_in <= "00101010";
    write_enable <= '1';
    wait for 1 ns;
    write_enable <= '0';
    output_enable <= '0';
    wait for 1 ns;
    clear <= '1';
    wait for 1 ns;
    clear <= '0';
    wait for 10 ns;
end process;
end Behavioral;
