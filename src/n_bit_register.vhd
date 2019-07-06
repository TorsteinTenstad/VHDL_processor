library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_register is
    Generic(n : integer := 8);
    Port (clk : in STD_LOGIC;
          data_in : in STD_LOGIC_VECTOR (n-1 downto 0);
          data : out STD_LOGIC_VECTOR (n-1 downto 0);
          data_out : out STD_LOGIC_VECTOR (n-1 downto 0);
          write_enable : in STD_LOGIC;
          output_enable : in STD_LOGIC;
          clear : in STD_LOGIC);
end n_bit_register;

architecture Behavioral of n_bit_register is

component tri_state_buffer is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           enable : in STD_LOGIC);
end component;

component flip_flop is
Port   (clk : in STD_LOGIC;
        enable : in STD_LOGIC;
        D : in STD_LOGIC;
        Q : out STD_LOGIC;
        reset : in STD_LOGIC);
end component;

signal data_sig : STD_LOGIC_VECTOR (n-1 downto 0);

begin

data <= data_sig;

GEN : for i in 0 to n-1 generate
    flip_flop_inst : flip_flop
    port map(clk    => clk,
             enable => write_enable, 
             D      => data_in(i), 
             Q      => data_sig(i),
             reset  => clear);

    tri_state_buffer_inst : tri_state_buffer
    port map(input  => data_sig(i),
             output => data_out(i),
             enable => output_enable);
       
end generate GEN;

end Behavioral;
