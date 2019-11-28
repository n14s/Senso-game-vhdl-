library ieee; use ieee.std_logic_1164.all;

architecture behav of input is
	signal	tx_n, tx_sync, key:	std_logic;
	-- da fehlen signale
	-- vorallem vom moore
	begin
		synchronizer: process(clk, res_n) is
		--Varrrr ich bin ein pirat
		variable flippy: 	std_logic;
		variable inv:		std_logic;
		begin
			if res_n = '0' then
				-- set output 0
				flippy := 0;
				tx_sync <= '0';
			else
				if clk'event and clk = '0' then
					--tx_n invertieren
					if tx_n = '0' then
						inv := 1;
					else
						inv := 0;
					--DLatch logic
					tx_sync <= flippy;
					flippy := inv;
				end if;
			end if;
		end synchronizer;
		
		fns: process(clk, res_n) is
		--wawawaaaaaa
		begin
			