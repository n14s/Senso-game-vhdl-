library ieee; use ieee.std_logic_1164.all;
entity timer is
  port( clk, res_n: in std_logic;
        start_timer: in std_logic;
		  dec_duration, res_duration: in std_logic;
        timer_expired: out std_logic);
end entity timer;

