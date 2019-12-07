library ieee; use ieee.std_logic_1164.all; library work; use work.all;

architecture behav of input is
signal keys: std_logic_vector(0 to 3);
begin
	button1: entity button
		port map (clk => clk, res_n => res_n, tx_n => key_in_n(0), key => keys(0) );
	button2: entity button
		port map (clk => clk, res_n => res_n, tx_n => key_in_n(1), key => keys(1) );
	button3: entity button
		port map (clk => clk, res_n => res_n, tx_n => key_in_n(2), key => keys(2) );	
	button4: entity button
		port map (clk => clk, res_n => res_n, tx_n => key_in_n(3), key => keys(3) );
	
	map_key_to_color: process(clk, res_n) is
	begin
		if res_n = '0' then
			key_valid <= '0';
			key_color <= "00";
		else
			if clk'event and clk= '1' then
				if keys(3) = '1' then
					key_color <= "00";
					key_valid <= '1';
				elsif keys(2) = '1' then
					key_color <= "01";
					key_valid <= '1';
				elsif keys(1) = '1' then
					key_color <= "10";
					key_valid <= '1';
				elsif keys(0) = '1' then
					key_color <= "11";
					key_valid <= '1';
				else
					key_valid <= '0';
					key_color <= "00";
				end if;
			end if;
		end if;
	end process;				
				
					
				
end architecture behav;