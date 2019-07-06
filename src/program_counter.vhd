library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is
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
end program_counter;

architecture Behavioral of program_counter is

component n_bit_register is
    Generic(n : integer := 8);
    Port (clk : in STD_LOGIC;
          data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
          data : out STD_LOGIC_VECTOR (n-1 downto 0);
          data_out : out STD_LOGIC_VECTOR (n-1 downto 0);
          write_enable : in STD_LOGIC;
          output_enable : in STD_LOGIC;
          clear : in STD_LOGIC);
end component;

component incr_n_bits_by_one is
    Generic(n : integer := 8);
    Port ( input : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           overflow_flag : out STD_LOGIC);
end component;

component n_bit_mux is
    Generic(n : integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           output : out STD_LOGIC_VECTOR (n-1 downto 0);
           sel : in STD_LOGIC);
end component;

signal mux_output : STD_LOGIC_VECTOR (n-1 downto 0);
signal data_sig : STD_LOGIC_VECTOR (n-1 downto 0);
signal incremented_data : STD_LOGIC_VECTOR (n-1 downto 0);

begin

data <= data_sig;

n_bit_register_inst : n_bit_register
    generic map(n => n)
    port map(clk           => clk,
             data_in       => mux_output,
             data          => data_sig,
             data_out      => data_out,
             write_enable  => '1',
             output_enable => output_enable,
             clear         => clear
             );
             
incr_n_bits_by_one_inst : incr_n_bits_by_one
    generic map(n => n)
    port map(input         => data_sig,
             output        => incremented_data,
             overflow_flag => overflow_flag
             );

n_bit_mux_inst : n_bit_mux
    generic map(n => n)
    port map(A      => incremented_data,
             B      => data_in,
             output => mux_output,
             sel    => write_enable
             );             

end Behavioral;
