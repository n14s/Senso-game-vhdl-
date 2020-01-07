library ieee; use ieee.numeric_std.all; use ieee.std_logic_1164;

architecture behav of galois is
begin
	galois: process(clk, res_n) is
		variable sr, mr:			std_logic_vector(7 downto 0);
		variable fb:				std_logic_vector(6 downto 0):= "1101000";
		variable seed: 			std_logic_vector(7 downto 0):= "00000001";
	begin
		if res_n = '0' then
		sr := seed;
		mr := seed;
		else
			if clk'event and clk = '1' then
				if restore_rnd = '1' then
					sr := mr;
				elsif next_rnd = '1' then
					if sr(7) = '1' then
						sr := (sr(6 downto 0) xor fb) & sr(7);
					else
						sr := sr(6 downto 0) & sr(7);
					end if;
					rnd(0) <= sr(6);
					rnd(1) <= sr(7);
				end if;			
				if store_rnd = '1' then -- and restore_rnd = '0' and next_rnd = '0' then
					mr := sr;
				end if;
			end if;
		end if;
				 
	
	end process galois;
end architecture behav;
