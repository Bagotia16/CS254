library ieee;
use ieee.std_logic_1164.all;

entity FourByTwoEncode is
	port ( i : in std_logic_vector (3 downto 0);
	en: in std_logic;
	z : out std_logic_vector (1 downto 0));
end entity;

architecture Struct of FourByTwoEncode is

component TwoByOneMux is
	port ( A : in std_logic;
			B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal f1,f2: std_logic;

begin
	M1:TwoByOneMux port map(i(1), '1', i(3), f1);	
	M2:TwoByOneMux port map('0', f1, en, z(0));
	M3:TwoByOneMux port map(i(2), '1', i(3), f2);
	M4:TwoByOneMux port map('0', f2, en, z(1));

end Struct;