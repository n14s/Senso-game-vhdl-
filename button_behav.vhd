library ieee; use ieee.std_logic_1164.all;

architecture behav of button is
	signal	tx_n, tx_sync, key:	std_logic;
	type		states is (IDLE, PRESSED_ONE_CYCLE, PRESSED_LONGER);
	signal	current_state, next_state: states;
	-- da fehlen signale
	-- vorallem vom moore
begin
	synchronizer: process(clk, res_n) is
	--Varrrr ich bin ein pirat
	variable flippy: 	std_logic;
	begin
		if res_n = '0' then
			-- set output 0
			flippy := '0';
			tx_sync <= '0';
		else
			if clk'event and clk = '0' then
				--DLatch logic
				tx_sync <= flippy;
				flippy := not tx_n;
			end if;
		end if;
	end process synchronizer;
	
	state: process(clk, res_n) is
	--STATE VAR
	begin
		if res_n = '0' then
			current_state <= IDLE;
		else
			if clk'event and clk='1' then
				current_state <= next_state;
			end if;
		end if;
	end process state;
	
	output: process(clk, res_n) is
	--OUTPUT VAR
	begin
		case current_state is
		when IDLE =>
			key <= '0';
		when PRESSED_ONE_CYCLE =>
			key <= '1';
		when PRESSED_LONGER =>
			key <= '0';
		end case;
	end process output;
	
	transition: process(clk, res_n) is
	--TRANSITION VAR
	begin
		case current_state is
		when IDLE =>
			if tx_sync = '1' then
				next_state <= PRESSED_ONE_CYCLE;
			else
				next_state <= IDLE;
			end if;
		when PRESSED_ONE_CYCLE =>
			if tx_sync = '1' then
				next_state <= PRESSED_LONGER;
			else
				next_state <= IDLE;
			end if;
		when PRESSED_LONGER =>
			if tx_sync = '1' then
				next_state <= PRESSED_LONGER;
			else
				next_state <= IDLE;
			end if;
		end case;
	end process transition;
end architecture behav;
