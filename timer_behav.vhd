library ieee; use ieee.std_logic_1164.all; 

architecture behav of timer is
begin
	run_timer: process(clk, res_n) is
		variable timer_on: std_logic;
		variable ticks: integer;
	begin
		if res_n = '0' then
			timer_expired <=  '0';
			timer_on:= '0';
			ticks := 0;
		else
			if clk'event and clk = '1' then
				timer_expired <= '0';
				if start_timer = '1' then
					timer_on := '1';
				end if;
				if timer_on = '1' then
					ticks := ticks +1;
				else
					ticks := 0;
				end if;
				if ticks = 25000000 then
					timer_on := '0';
					timer_expired <= '1';
				end if;
			end if;
		end if;
	end process;
end architecture;
