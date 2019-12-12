library ieee; use ieee.std_logic_1164.all;

architecture behav of output is
begin
	configure_output: process (led_on, all_on) is
	begin
		if all_on = '1' then
			leds <= (others => '1');
		elsif led_on = '1' then
			case color is
				when "00" => leds <= "0001";
				when "01" => leds <= "0010";
				when "10" => leds <= "0100";
				when "11" => leds <= "1000";
			end case;
		else
			leds <= "0000";
		end if;
	end process;
end architecture;