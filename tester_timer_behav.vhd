library ieee; use ieee.std_logic_1164.all;

architecture behav of tester_timer is
begin
	timer_test: process is
	begin
		start_timer <= '0';
		wait for 50 ns;
		start_timer <= '1';
		wait for 100 ns;
		start_timer <= '0';
		wait for 500 ms;
		start_timer <= '1';
		wait for 30 ns;
		start_timer <= '0';
		wait for 100 ns;
		start_timer <= '1';
		wait;
	end process;

end architecture;