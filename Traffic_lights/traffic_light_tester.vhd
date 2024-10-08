library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light_tester is 
    Port ( o_clk, o_rst : out STD_LOGIC;
        i_green, i_yellow, i_red : in STD_LOGIC 
    );
end traffic_light_tester;

architecture traffic_light_tester_arch of traffic_light_tester is

    signal clk_sig : STD_LOGIC := '1';

    constant clockPeriod : time := 1 sec;
    signal clk : std_logic := '0';

    begin
        
        clk <= not clk after clockPeriod / 10;
        o_clk <= clk;
	
	process 
	begin
		o_rst <= '0';
		wait for clockPeriod * 24;
		o_rst <= '1';
		wait for clockPeriod * 3;
		o_rst <= '0';
		wait;
	end process;
		
end traffic_light_tester_arch;