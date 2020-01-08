library work; use work.all;
library ieee; use ieee.std_logic_1164.all;


architecture struct of tb is
	-- CLK
	signal clk, res_n: std_logic;
	-- NOT CONTROL
	-- Couter
	signal score_low_int, score_high_int:												std_logic_vector(6 downto 0);
	-- Input
	signal key_in_n_int:																		std_logic_vector(3 downto 0);
	-- Output
	signal leds_int:																			std_logic_vector(3 downto 0);
begin
	-- clk
	senso_clk: entity clk_res_gen
		port map(clk => clk, res_n => res_n);
-----------------------------------------
-- senso --------------------------------
	senso_game: entity senso
		port map(clk => clk, res_n => res_n, score_low_int => score_low_int, 
		score_high_int => score_high_int, key_in_n_int => key_in_n_int, leds_int => leds_int);
-----------------------------------------
-- input test ---------------------------
	senso_tester: entity tester_input
		port map(clk => clk, res_n => res_n, tester_key => key_in_n_int);
------------------------------------------
-- timer test ----------------------------
--	senso_timer_tester: entity tester_timer
--		port map(clk => clk, res_n => res_n, start_timer => start_timer_int, dec_duration => dec_duration_int, res_duration => res_duration_int);
--------------------------------------------

end architecture;