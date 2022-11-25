library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LS74138 is
  port (
    A, E: in std_logic_vector(2 downto 0);
    O: out std_logic_vector(7 downto 0)
  ) ;
end LS74138;

architecture logic of LS74138 is
    signal a_not : std_logic_vector(2 downto 0);
    signal enable: std_logic;
begin

    -- Enable Logic
    enable <= (NOT E(0) AND NOT E(1) ) AND E(2);
    
    -- Negate the input vector A
    a_not <= NOT A;

    -- Output Circuit
    O(0) <= (enable AND a_not(0) AND a_not(1) AND a_not(2));
    O(1) <= (enable AND A(0) AND a_not(1) AND a_not(2));
    O(2) <= (enable AND a_not(0) AND A(1) AND a_not(2));
    O(3) <= (enable AND A(0) AND A(1) AND a_not(2));
    O(4) <= (enable AND a_not(0) AND a_not(1) AND A(2));
    O(5) <= (enable AND A(0) AND a_not(1) AND A(2));
    O(6) <= (enable AND a_not(0) AND A(1) AND A(2));
    O(7) <= (enable AND A(0) AND A(1) AND A(2));

end logic ; -- logic

architecture functional of LS74138 is
  signal f : std_logic_vector(5 downto 0);
begin

  -- Concatenate the two input vectors
  f <= E & A;
  O <= "10000000" WHEN f = "100111" ELSE
       "01000000" WHEN f = "100110" ELSE 
       "00100000" WHEN f = "100101" ELSE
       "00010000" WHEN f = "100100" ELSE
       "00001000" WHEN f = "100011" ELSE
       "00000100" WHEN f = "100010" ELSE
       "00000010" WHEN f = "100001" ELSE
       "00000001" WHEN f = "100000" ELSE
       "00000000";

end functional ; -- functional
