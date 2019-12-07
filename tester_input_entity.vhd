library ieee; use ieee.std_logic_1164.all;

entity tester_input is
	port(clk, res_n: in std_logic;
			tester_key: out std_logic_vector(0 to 3));
end entity tester_input;
			