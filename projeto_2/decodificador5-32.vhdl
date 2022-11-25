library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SN54_74LS138 is
  port (
    A: in std_logic_vector(4 downto 0) ;
    O: out std_logic_vector(31 downto 0)
  ) ;
end SN54_74LS138;

architecture arch of SN54_74LS138 is

    component LS74138
        port(
            A, E: in std_logic_vector(2 downto 0);
            O: out std_logic_vector(7 downto 0)
        );
    end component;

    signal enable : std_logic_vector(11 downto 0) ;

begin

    -- Set the enable pins
    enable(0) <= NOT A(3);
    enable(1) <= NOT A(4);
    enable(2) <= '1';
    enable(3) <= '1';
    enable(4) <= NOT A(4);
    enable(5) <= A(3);
    enable(6) <= '1';
    enable(7) <= NOT A(3);
    enable(8) <= A(4);
    enable(9) <= '1';
    enable(10) <= A(3);
    enable(11) <= A(4);

    -- Set the decoders
    DEC1: entity work.LS74138(logic) port map(A => A(2 downto 0), E => enable(2 downto 0), O => O(7 downto 0));
    DEC2: entity work.LS74138(logic) port map(A => A(2 downto 0), E => enable(5 downto 3), O => O(15 downto 8));
    DEC3: entity work.LS74138(logic) port map(A => A(2 downto 0), E => enable(8 downto 6), O => O(23 downto 16));
    DEC4: entity work.LS74138(logic) port map(A => A(2 downto 0), E => enable(11 downto 9), O => O(31 downto 24));

end arch ; -- arch