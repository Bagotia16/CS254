library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity TrafficLightController is
	port ( clk, rst : in std_logic;
	green, yellow, red: out std_logic_vector(3 downto 0));
end entity;

architecture road of TrafficLightController is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
	signal state: state_type;
	signal count: integer range 0 to 35 := 0;
	constant SEC30: integer := 30;
	constant SEC5: integer := 5;
	
	begin
		process(clk, rst)
		begin
			if rst = '1' then
				state <= s0;
				count <= 0;
			
			elsif clk'event and clk = '1' then
				case state is
				
					when s0 =>
						if count < SEC30 then
							state <= s0;
							count <= count +1;
						else
							state <= s1;
							count <= 0;
						end if;
						
					when s1 =>
						if count < SEC5 then
							state <= s1;
							count <= count +1;
						else
							state <= s2;
							count <= 0;
						end if;
						
					when s2 =>
						if count < SEC30 then
							state <= s2;
							count <= count +1;
						else
							state <= s3;
							count <= 0;
						end if;
						
					when s3 =>
						if count < SEC5 then
							state <= s3;
							count <= count +1;
						else
							state <= s4;
							count <= 0;
						end if;
					
					when s4 =>
						if count < SEC30 then
							state <= s4;
							count <= count +1;
						else
							state <= s5;
							count <= 0;
						end if;
						
					when s5 =>
						if count < SEC5 then
							state <= s5;
							count <= count +1;
						else
							state <= s6;
							count <= 0;
						end if;
						
					when s6 =>
						if count < SEC30 then
							state <= s6;
							count <= count +1;
						else
							state <= s7;
							count <= 0;
						end if;
						
					when s7 =>
						if count < SEC5 then
							state <= s7;
							count <= count +1;
						else
							state <= s0;
							count <= 0;
						end if;
					
--					when others =>
--						state <= s0;
				end case;
			end if;
			
		case state is 
			
			when s0=>
				green <= "0001";
				yellow <= "0000";
				red <= "1110";
			
			when s1=>
				green <= "0000";
				yellow <= "0001";
				red <= "1110";
				
			when s2=>
				green <= "0010";
				yellow <= "0000";
				red <= "1101";
				
			when s3=>
				green <= "0000";
				yellow <= "0010";
				red <= "1101";
				
			when s4=>
				green <= "0100";
				yellow <= "0000";
				red <= "1011";
				
			when s5=>
				green <= "0000";
				yellow <= "0100";
				red <= "1011";
				
			when s6=>
				green <= "1000";
				yellow <= "0000";
				red <= "0111";
				
			when s7=>
				green <= "0000";
				yellow <= "1000";
				red <= "0111";
			
		end case;
		end process;
		

end road;