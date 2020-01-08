library ieee; use ieee.std_logic_1164.all;

entity senso is
	port(	clk, res_n: 											in		std_logic;
			key_in_n_int:											in		std_logic_vector(3 downto 0);
			score_low_int, score_high_int:					out	std_logic_vector(6 downto 0);
			leds_int:												out	std_logic_vector(3 downto 0));
end entity senso;