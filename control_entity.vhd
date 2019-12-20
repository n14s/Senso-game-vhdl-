library ieee; use ieee.std_logic_1164.all;

entity control is
	port(	clk, res_n: 											in		std_logic;
			-- Random
			next_rnd, restore_rnd, store_rnd:				out	std_logic;
			rnd:														in		std_logic_vector(0 to 1));
			-- Input 
			key_valid:												in		std_logic;
         key_color:												in		std_logic_vector(1 downto 0);
			-- Counter
			res_step, inc_step, res_score, inc_score:		out	std_logic;
			step_eq_score:											in		std_logic;
			-- Output
			led_on, all_on:										out	std_logic;
			);
end entity control;