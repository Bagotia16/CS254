library ieee;
use ieee.std_logic_1164.all;

entity TwoByFourDecode is
	port ( i : in std_logic_vector (1 downto 0);
	en: in std_logic;
	z : out std_logic_vector (3 downto 0));
end entity;

architecture Struct of TwoByFourDecode is
	
component TwoByOneMux is
	port ( A : in std_logic;
			B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal f: std_logic_vector (7 downto 0);

begin
	
	M1: TwoByOneMux port map('1', '0', i(0), f(0));
	M2: TwoByOneMux port map(f(0), '0', i(1), f(1));
	M3: TwoByOneMux port map('0', f(1), en, z(0));
	M4: TwoByOneMux port map('1', '0', i(1), f(2));
	M5: TwoByOneMux port map('0', f(2), i(0), f(3));
	M6: TwoByOneMux port map('0', f(3), en, z(1));
	M7: TwoByOneMux port map('1', '0', i(0), f(4));
	M8: TwoByOneMux port map('0', f(4), i(1), f(5));
	M9: TwoByOneMux port map('0', f(5), en, z(2));
	M10: TwoByOneMux port map('0', '1', i(0), f(6));
	M11: TwoByOneMux port map('0', f(6), i(1), f(7));
	M12: TwoByOneMux port map('0', f(7), en, z(3));
	
end Struct;
	
