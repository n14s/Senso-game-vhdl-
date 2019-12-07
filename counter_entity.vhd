library ieee;  use ieee.std_logic_1164.all;
entity counter is
	port( clk, res_n, res_step, inc_step, res_score, inc_score:			in		std_logic;
			step_eq_score:																out	std_logic;
			score_low, score_high:													out	std_logic_vector(6 downto 0)
			);		
end entity counter;
			