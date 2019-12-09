library work; use work.all;
library ieee; use ieee.std_logic_1164.all;


architecture struct of tb is
	signal clk, res_n: std_logic;
	--signal valid_int: std_logic;
	--signal color_int: std_logic_vector(0 to 1);
	--signal key_int: std_logic_vector(0 to 3);
	signal start_timer, timer_expired: std_logic;
	
begin
	senso_clk: entity clk_res_gen
		port map(clk => clk, res_n => res_n);
-----------------------------------------
-- input test ---------------------------
--	senso_input: entity input
--		port map(clk => clk, res_n => res_n, key_in_n => key_int, key_valid => valid_int , key_color => color_int);
--	senso_tester: entity tester_input
--		port map(clk => clk, res_n => res_n, tester_key => key_int);
------------------------------------------
-- timer test ----------------------------
	senso_timer: entity timer
		port map(clk => clk, res_n => res_n, start_timer => start_timer, timer_expired => timer_expired);
	senso_timer_tester: entity tester_timer
		port map(clk => clk, res_n => res_n, start_timer => start_timer);
	
end architecture struct;
