library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LS74595 is
  port (
    GN, RCK, SCLRN, SCK, SI: in std_logic;
    Q: out std_logic_vector(7 downto 0);
    Qhp: out STD_LOGIC
  ) ;
end LS74595;

architecture structure of LS74595 is
begin
end structure ; -- structure

architecture behaviour of LS74595 is

    -- Components used in the architecture
    component FFD
        port(
            CLK, D, RST: in STD_LOGIC;
            Q: out STD_LOGIC
        );
    end component;

	component tri_state_buffer
		PORT(D_in, SEL: in STD_LOGIC;
			D_out: out STD_LOGIC
		);
	end component;

    -- Signals used in the architecture
    signal shift_register_outputs: std_logic_vector(7 downto 0);
    signal storage_register_outputs: std_logic_vector(7 downto 0);

begin

    -- Map the shift Registers
    SHIFT_FFD_MAPPING : for i in 0 to 7 generate

            first_generate:
              if (i = 0) generate
                firsrt_mapping: entity work.FFD port map(D => SI, CLK => SCK, RST => SCLRN, Q => shift_register_outputs(0));
              end generate first_generate;

            others_generate:
              if (i /= 0) generate
                firsrt_mapping: entity work.FFD port map(D => shift_register_outputs(i-1), CLK => SCK, RST => SCLRN, Q => shift_register_outputs(i));
            end generate others_generate;


    end generate SHIFT_FFD_MAPPING;

	-- Map the Memory Registers
    MEMORY_FFD_MAPPING : for i in 0 to 7 generate

		  mapping_memory_registers: entity work.FFD port map(D => shift_register_outputs(i), CLK => SCK, RST => '1', Q => storage_register_outputs(i));

	  end generate MEMORY_FFD_MAPPING;


	-- Map the Tri-State buffers
    TRI_STATE_MAPPING : for i in 0 to 7 generate

		  mapping_tri_state_registers: entity work.tri_state_buffer port map(D_in => storage_register_outputs(i), SEL => GN, D_out => Q(i));

	  end generate TRI_STATE_MAPPING;

	-- Map Last output bit to Qhp
	Qhp <= shift_register_outputs(7);



end behaviour ; -- behaviour