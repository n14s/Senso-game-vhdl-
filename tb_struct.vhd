library work; use work.all;
library ieee; use ieee.std_logic_1164.all;


architecture struct of tb is
	-- CLK
	signal clk, res_n: std_logic;
	-- Random
	signal next_rnd_int, restore_rnd_int, store_rnd_int:							std_logic;
	signal rnd_int:																			std_logic_vector(0 to 1);
	-- Input 
	signal key_valid_int:																	std_logic;
	signal key_color_int:																	std_logic_vector(1 downto 0);
	-- Timer
	signal start_timer_int:																	std_logic;
	signal dec_duration_int, res_duration_int: 									 	std_logic;
	signal timer_expired_int: 																std_logic;
	-- Counter
	signal res_step_int, inc_step_int, res_score_int, inc_score_int:			std_logic;
	signal step_eq_score_int:																std_logic;
	-- Output
	signal led_on_int, all_on_int:														std_logic;
	-- NOT CONTROL
	-- Couter
	signal score_low_int, score_high_int:												std_logic_vector(6 downto 0);
	-- Input
	signal key_in_n_int:																		std_logic_vector(3 downto 0);
	-- Input tester
	signal tester_key_int:																	std_logic_vector(0 to 3);
	-- Output
	signal color_int:																			std_logic_vector(1 downto 0);
	signal leds_int:																			std_logic_vector(3 downto 0);
begin
	-- clk
	senso_clk: entity clk_res_gen
		port map(clk => clk, res_n => res_n);
-----------------------------------------
-- input test ---------------------------
	senso_input: entity input
		port map(clk => clk, res_n => res_n, key_in_n => key_in_n_int, key_valid => key_valid_int , key_color => key_color_int);
	senso_tester: entity tester_input
		port map(clk => clk, res_n => res_n, tester_key => tester_key_int);
------------------------------------------
-- timer test ----------------------------
	senso_timer: entity timer
		port map(clk => clk, res_n => res_n, start_timer => start_timer_int, timer_expired => timer_expired_int, dec_duration => dec_duration_int, res_duration => res_duration_int);
--	senso_timer_tester: entity tester_timer
--		port map(clk => clk, res_n => res_n, start_timer => start_timer_int, dec_duration => dec_duration_int, res_duration => res_duration_int);
--------------------------------------------
-- Final test ----------------------------	
	senso_galois: entity galois
		port map(clk => clk, res_n => res_n, next_rnd => next_rnd_int, restore_rnd => restore_rnd_int, store_rnd => store_rnd_int, rnd => rnd_int);
	senso_counter: entity counter
		port map(clk => clk, res_n => res_n, res_step => res_step_int, inc_step => inc_step_int, res_score => res_score_int, inc_score => inc_score_int, step_eq_score => step_eq_score_int, score_low => score_low_int, score_high => score_high_int);			
	senso_output: entity output
		port map(led_on => led_on_int, all_on => all_on_int, color => color_int, leds => leds_int);
	senso_control: entity control
		port map(clk => clk, res_n => res_n, next_rnd => next_rnd_int, restore_rnd => restore_rnd_int, store_rnd => store_rnd_int, rnd => rnd_int, key_valid => key_valid_int, key_color => key_color_int, start_timer => start_timer_int, dec_duration => dec_duration_int, res_duration => res_duration_int, timer_expired => timer_expired_int, res_step => res_step_int, inc_step => inc_step_int, res_score => res_score_int, inc_score => inc_score_int, step_eq_score => step_eq_score_int, led_on => led_on_int, all_on => all_on_int);
		end architecture struct;
