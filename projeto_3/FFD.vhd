library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FFD is
  port (
    CLK, D, RST: in STD_LOGIC;
    Q: out STD_LOGIC
  );
end FFD;

architecture arch of FFD is
begin

    RISING_CLK_SAVE : process(CLK, RST)
    begin

        if (RST = '0')then
            Q <= '0';

        elsif (rising_edge(CLK)) then
            Q <= D;

        end if;
            
        
    end process; -- RISING_CLK_SAVE

end arch ; -- arch