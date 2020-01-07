library ieee; use ieee.std_logic_1164.all;

architecture behav of control is
	type states is (IDLE, INIT, READY, STARTSHOW, LEDOFF, COMPARE, LEDON, STARTPLAY, CORRECT, LOCKCORRECT, LEVELUP, OVER);
	
	signal current_state, next_state: states;
begin

	state: process(clk, res_n) is
	begin
		if res_n = '0' then
			current_state <= IDLE;
		else 
			if clk'event and clk = '1' then
				current_state <= next_state;
			end if;
		end if;
	end process state;
	
	output: process(clk, res_n) is
	begin
		case current_state is
			when IDLE =>
				res_score <= '1';
				res_step <= '1';
				next_rnd <= '1';
				res_duration <= '1';
				all_on <= '0';
				start_timer <= '0';
			when INIT =>
				res_score <= '0';
				res_step <= '0';
				next_rnd <= '0';
				store_rnd <= '1';
				res_duration <= '0';
			when READY =>
				store_rnd <= '0';
				restore_rnd <= '1';
			when STARTSHOW =>
				led_on <= '1';
				start_timer <= '1';
				res_step <= '0';
				dec_duration <= '0';
				restore_rnd <= '0';
				inc_score <= '0';
			when LEDOFF =>
				led_on <= '0';
				start_timer <= '0';
				inc_step <= '1';
				next_rnd <= '1';
			when COMPARE =>
				inc_step <= '0';
				next_rnd <= '0';
			when LEDON =>
				led_on <= '1';
				start_timer <= '1';
			when STARTPLAY =>
				res_step <= '1';
				inc_step <= '0';
				next_rnd <= '0';
				restore_rnd <= '1';
			when CORRECT =>
				res_step <= '0';
				restore_rnd <= '0';
				inc_step <= '1';
				next_rnd <= '1';
			when LOCKCORRECT =>
				inc_step <= '0';
				next_rnd <= '0';
			when LEVELUP =>
				inc_score <= '1';
				dec_duration <= '1';
				res_step <= '1';
			when OVER =>
				all_on <= '1';
				start_timer <= '1';
				restore_rnd <= '0';
		end case;
	end process output;
	
	
	transition: process(current_state, key_valid, timer_expired, step_eq_score, key_color, rnd) is
	begin
		case current_state is
			when IDLE => 
				if key_valid = '1' then next_state <= INIT; end if;
			when INIT => 
				next_state <= READY;
			when READY => 
				next_state <= STARTSHOW;
			when STARTSHOW => 
				if timer_expired = '1' then next_state <= LEDOFF; end if;
			when LEDOFF => 
				next_state <= COMPARE;
			when COMPARE => 
				if step_eq_score = '0' then 
					next_state <= LEDON;
				else 
					next_state <= STARTPLAY;
				end if;
			when LEDON =>	
				if	timer_expired = '1' then next_state <= LEDOFF; end if;
			when STARTPLAY =>	
				if key_valid = '1' then
					if key_color = rnd then 
						next_state <= CORRECT;
					else
						next_state <= OVER;
					end if;
				end if;
			when CORRECT => 
				next_state <= LOCKCORRECT;
			when LOCKCORRECT => 
				if step_eq_score = '1' then
					next_state <= LEVELUP;
				elsif key_valid = '1' then
					if key_color = rnd then
						next_state <= CORRECT;
					else
						next_state <= OVER;
					end if;
				end if;
			when LEVELUP => 
				next_state <= STARTSHOW;
			when OVER => 
				if timer_expired = '1' then next_state <= IDLE; end if;
		end case;
	end process transition;
end architecture behav;
	
	
	