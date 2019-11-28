library ieee; use ieee.std_logic_1164.all;

entity galois is
	port(	clk, res_n, next_rnd, restore_rnd, store_rnd:in		std_logic;
			rnd:														out	std_logic_vector(0 to 1));
end entity galois;