library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop is
Port   (clk : in std_logic;
        enable : in std_logic;
        D : in std_logic;
        Q : out std_logic;
        reset : in std_logic);
end flip_flop;

architecture Behavioral of flip_flop is

begin
    process(clk, reset)
    begin
        if reset = '1' then
		 Q <= '0';
        elsif rising_edge(clk) and enable = '1' then
            Q <= D;
        end if;
    end process;
end Behavioral;