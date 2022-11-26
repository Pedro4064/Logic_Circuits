library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_LS74595 is
end tb_LS74595;

architecture tb of tb_LS74595 is

	component LS74595 is
		port (
			GN, RCK, SCLRN, SCK, SI: in std_logic;
			Q: out std_logic_vector(7 downto 0);
			Qhp: out STD_LOGIC
		) ;
	end component;

	signal GN_in, RCK_in, SCLRN_in, SCK_in, SI_in : std_logic;
	signal Q_in : std_logic_vector(7 downto 0);
	signal Qhp_in : std_logic;

begin
	device_mapping: entity work.LS74595 port map(GN => GN_in, RCK => RCK_in, SCLRN => SCLRN_in, SCK => SCK_in, SI => SI_in, Q => Q_in, Qhp => Qhp_in);
	test_bench : process begin

		-- The first clock cicle
		SCK_in <='0';
		RCK_in <= '0';
		GN_in  <= '0';
		SCLRN_in <= '0';
		SI_in  <= '0';
		wait for 10 ns;

		SCK_in <='1';
		wait for 10 ns;

		SCK_in <='0';
		SCLRN_in <= '1';
		wait for 10 ns;


		-- Move the one bit up to the last parallel place
		for i in 0 to 8 loop

			SCK_in <= '1';
			RCK_in <= '0';
			if i = 0 then
				SI_in <= '1';
			else
				SI_in <= '0';
			end if;

			wait for 10 ns;

			SCK_in <= '0';
			RCK_in <= '1';
			wait for 10 ns;


		end loop;

		-- Show HIGH impedance
		GN_in <= '1';

		SCK_in <= '1';
		RCK_in <= '0';
		wait for 10 ns;

		SCK_in <= '0';
		RCK_in <= '1';
		wait for 10 ns;

	end process test_bench;

end tb;