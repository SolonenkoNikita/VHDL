library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light is
	Port ( i_clk, i_rst : in STD_LOGIC;
		o_green, o_yellow, o_red : out STD_LOGIC);
end entity;

architecture traffic_light_arch of traffic_light is

signal cnt_quarter_sec : std_logic_vector (2 downto 0) := "000";
signal cnt_sec : std_logic_vector (3 downto 0) := "0000";
signal green : std_logic := '0';
signal yellow : std_logic := '0';
signal red : std_logic := '0';

begin
	
	o_green <= green;
	o_yellow <= yellow; 
	o_red <= red;

	process(i_clk, i_rst) is
	begin

		if (i_rst = '1') then 
			cnt_sec <= "0000";
			cnt_quarter_sec <= "000";
		elsif (rising_edge(i_clk)) then
			cnt_quarter_sec <= cnt_quarter_sec + 1;
			if (cnt_quarter_sec = 4) then
				cnt_sec <= cnt_sec + 1;
				cnt_quarter_sec <= "000";
			end if;

			if (cnt_sec < 5) then
				green <= '0'; 
				yellow <= '0';
				red <= '1';
			elsif (cnt_sec < 7) then
				green <= '0'; 
				yellow <= '1';
				red <= '1';	
			elsif (cnt_sec < 12) then
				green <= '1'; 
				yellow <= '0';
				red <= '0';
			elsif (cnt_sec < 14) then
				if (cnt_quarter_sec(0) = '0') then
					green <= '1';
				else
					green <= '0';
				end if;
				yellow <= '0';
				red <= '0';
			else
				cnt_sec <= "0000";
				cnt_quarter_sec <= "000";
			end if;

		end if;

	end process; 

end architecture;