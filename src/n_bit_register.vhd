library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_register is
    Generic(n : integer := 8);
    Port (clk : in std_logic;
          input : in std_logic_vector (n-1 downto 0);
          data : out std_logic_vector (n-1 downto 0);
          output : out std_logic_vector (n-1 downto 0);
          write_enable : in std_logic;
          output_enable : in std_logic;
          clear : in std_logic);
end n_bit_register;

architecture Behavioral of n_bit_register is

component tri_state_buffer is
    Port ( input : in std_logic;
           output : out std_logic;
           enable : in std_logic);
end component;

component flip_flop is
Port   (clk : in std_logic;
        enable : in std_logic;
        D : in std_logic;
        Q : out std_logic;
        reset : in std_logic);
end component;

signal data_sig : std_logic_vector (n-1 downto 0);

begin

data <= data_sig;

GEN : for I in 0 to n-1 generate
    flip_flop_inst : flip_flop
    port map(clk    => clk,
             enable => write_enable, 
             D      => input(i), 
             Q      => data_sig(i),
             reset  => clear);

    tri_state_buffer_inst : tri_state_buffer
    port map(input  => data_sig(i),
             output => output(i),
             enable => output_enable);
       
   end generate GEN;

end Behavioral;
