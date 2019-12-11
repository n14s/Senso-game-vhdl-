library ieee; use ieee.std_logic_1164.all;

architecture behav of tester_timer is
begin
	timer_test: process is
	begin
		dec_duration <= '0';
		res_duration <= '0';
		start_timer <= '0';	
		wait for 50 ns;
		start_timer <= '1';
		wait for 100 ns;
		start_timer <= '0';
		dec_duration <= '1';
		wait for 20 ns;
		dec_duration <= '0';
		wait for 500 ms;
		dec_duration <= '1';
		start_timer <= '1';
		wait for 20 ns;
		dec_duration <= '0';
		start_timer <= '0';
		wait for 100 ns;
		start_timer <= '1';
		wait for 450 ms;
		res_duration <= '1';
		wait;
	end process;

end architecture;