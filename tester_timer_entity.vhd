library ieee; use ieee.std_logic_1164.all;

entity tester_timer is
	port(	clk, res_n: in std_logic;
			start_timer: out std_logic);
end entity tester_timer;