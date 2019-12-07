
architecture behav of clk_res_gen is
begin

        proc_clk: process is
        begin

                clk<= '1';
                wait for 10 ns;
                clk<= '0';
                wait for 10 ns;

        end process proc_clk;

        proc_res_n: process is
        begin

                res_n <= '0';
                wait for 30 ns;
                res_n <= '1';
                wait;

        end process proc_res_n;

end architecture behav;

