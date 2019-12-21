library ieee; use ieee.std_logic_1164.all;

architecture behav of tester_input is
begin
	some_input: process is
	begin
		tester_key <= "1111";
		wait for 50 ns;
		tester_key <= "0111";
		wait for 2200ns;
		tester_key <= "1011";
		wait for 2200ns;
		tester_key <= "1101";
		wait for 2200ns;
		tester_key <= "1110";
	end process;
	
end architecture;