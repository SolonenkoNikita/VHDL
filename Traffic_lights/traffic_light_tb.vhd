library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light_tb is
end traffic_light_tb;

architecture traffic_light_tb_arch of traffic_light_tb is

    signal clk : STD_LOGIC;
    signal rst : STD_LOGIC;
    signal green : STD_LOGIC;
    signal yellow : STD_LOGIC;
    signal red : STD_LOGIC;
    
    begin

        traffic_light_tester : entity work.traffic_light_tester(traffic_light_tester_arch) port map(
            o_clk => clk,
            o_rst => rst,
            i_green => green,
            i_yellow => yellow, 
            i_red => red
        );

        traffic_light : entity work.traffic_light(traffic_light_arch) port map(
            i_clk => clk,
            i_rst => rst,
            o_green => green,
            o_yellow => yellow,
            o_red => red
        );

end traffic_light_tb_arch;