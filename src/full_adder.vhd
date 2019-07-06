library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_in : in STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

sum <= (A xor B) xor carry_in;
carry_out <= ((A xor B) and carry_in) or (A and B);

end Behavioral;
