library ieee; use ieee.std_logic_1164.all;

architecture moore of control is
	type states is (IDLE, INIT, READY, STARTSHOW, LEDOFF, LEDON,
						STARTPLAY, CORRECT, LOCKCORRECT, LEVELUP, OVER);
	
	signal current_state, next_state, states;
begin
	
	transition: process(states) is
		case states is
			when IDLE 			=> if key_valid = '1' then next_state <= INIT;
			when INIT 			=> next_state <= READY;
			when READY			=> next_state <= STARTSHOW;
			when STARTSHOW 	=> if timer_expired = '1' then next_state <= LEDOFF;
			when LEDOFF			=> if step_eq_score = '0' then 
											next_state <= LEDON;
										else 
											next_state <= STARTPLAY;
										end if;
			when LEDON			=>	if	timer_expired = '1' then next_state <= LEDOFF;
			when STARTPLAY		=>	if key_valid = '1' then
											if key_color = rnd then 
												next_state <= CORRECT;
											else
												next_state <= OVER;
											end if;
										end if;
			when CORRECT		=> next_state <= LOCKCORRECT;
			when LOCKCORRECT	=> if key_valid = '1' then
											if key_color = rnd then
												if step_eq_score = '1' then
													next_state <= LEVELUP;
												else
													next_state <= CORRECT;
												end if;
											else
												next_state <= OVER;
											end if;
										end if;
			when LEVELUP		=> next_state <= STARTSHOW;
			when OVER			=> if timer_expired = '1' then next_state <= IDLE;
		end case;
					