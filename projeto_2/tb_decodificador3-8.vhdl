library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_LS74138 is
end tb_LS74138;

architecture tb of tb_LS74138 is

    component LS74138
        port(
            A, E: in std_logic_vector(2 downto 0);
            O: out std_logic_vector(7 downto 0)
        );
    end component;

    signal a_in : std_logic_vector(2 downto 0);
    signal e_in : std_logic_vector(2 downto 0);
    signal o_in : std_logic_vector(7 downto 0);

begin

    dut: LS74138 port map (A => a_in, E => e_in, O => o_in);

    process
    begin

	    
        a_in <= "XXX";
        e_in <= "XX1";
        wait for 1 ns;
        assert(o_in="00000000") report "Erro na Entrada XXX/XX1" severity error;



        a_in <= "XXX";
        e_in <= "X1X";
        wait for 1 ns;
        assert(o_in="00000000") report "Erro na Entrada XXX/X1X" severity error;



        a_in <= "XXX";
        e_in <= "0XX";
        wait for 1 ns;
        assert(o_in="00000000") report "Erro na Entrada XXX/0XX" severity error;



        a_in <= "000";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00000001") report "Erro na Entrada 000/100" severity error;



        a_in <= "001";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00000010") report "Erro na Entrada 001/100" severity error;



        a_in <= "010";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00000100") report "Erro na Entrada 010/100" severity error;



        a_in <= "011";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00001000") report "Erro na Entrada 011/100" severity error;



        a_in <= "100";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00010000") report "Erro na Entrada 100/100" severity error;



        a_in <= "101";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="00100000") report "Erro na Entrada 101/100" severity error;



        a_in <= "110";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="01000000") report "Erro na Entrada 110/100" severity error;



        a_in <= "111";
        e_in <= "100";
        wait for 1 ns;
        assert(o_in="10000000") report "Erro na Entrada 111/100" severity error;


    

    end process;

end tb ; -- tb
