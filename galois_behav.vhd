library ieee; use ieee.numeric_std.all; use ieee.std_logic_1164;

architecture behav of galois is
begin
	galois: process(clk, res_n) is
		variable sr, mr:			std_logic_vector(7 downto 0);
		variable fb:				std_logic_vector(6 downto 0);
	begin
		if clk'event and clk = '1' and res_n = '0' then
			if restore_rnd = '1' then
				sr := mr;
			elsif next_rnd = '1' then
				if sr(7) = '1' then
					sr := (sr(6 downto 0) xor fb) & sr(7);
				else
					sr := sr(6 downto 0) & sr(7);
				end if;
				rnd(0) <= SR(6);
				rnd(1) <= SR(7);
			end if;
			if store_rnd = '1' and restore_rnd = '0' and next_rnd = '0' then
				mr := sr;
			end if;
		end if;
				 
	
	end process galois;
end architecture behav;
