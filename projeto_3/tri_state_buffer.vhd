library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tri_state_buffer is
	PORT(D_in, SEL: in STD_LOGIC;
		 D_out: out STD_LOGIC
		);
end tri_state_buffer;


architecture arch of tri_state_buffer is
begin

	D_out <= D_in when SEL = '0' else
			     'Z';
end arch;