library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity TrafficLightController_testbench is
end entity;

architecture road of TrafficLightController_testbench is
	component TrafficLightController
		port ( clk, rst : in std_logic; 
				 green, yellow, red: out std_logic_vector(3 downto 0));
	end component;
	
	signal clk: std_logic := '0';
	signal rst: std_logic := '0';
	signal green: std_logic_vector(3 downto 0);
	signal yellow: std_logic_vector(3 downto 0);
	signal red: std_logic_vector(3 downto 0);

begin
	dut_instance : TrafficLightController
	port map(clk => clk, rst => rst, 
				green => green, yellow => yellow, red => red);
		

	process
	  begin
	  rst <= '0';
		 for i in 1 to 300 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
		
	  rst <= '1';
		 for i in 1 to 300 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
	  rst <= '0';
		 for i in 1 to 300 loop
			clk <= '1';
			wait for 0.5 sec;
			clk <= '0';
			wait for 0.5 sec;
		 end loop;
	  wait;
	end process;
	
end architecture;

			