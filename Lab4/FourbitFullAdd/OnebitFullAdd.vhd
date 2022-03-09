library ieee;
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
port ( a, b, cin : in std_logic;
sum, carry: out std_logic);
end entity;

architecture Struct of OnebitFullAdd is
	
component TwoByOneMux is
	port ( A : in std_logic;
			B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal s: std_logic_vector(6 downto 0);

begin
	M1: TwoByOneMux port map('1', '0', b, s(0));
	M2: TwoByOneMux port map(b, s(0), a, s(1));
	M3: TwoByOneMux port map('1', '0', cin, s(2));
	M4: TwoByOneMux port map(cin, s(2), s(1), sum);
	
	C1: TwoByOneMux port map('0', a, b, s(3));
	C2: TwoByOneMux port map('0', b, cin, s(4));
	C3: TwoByOneMux port map('0', cin, a, s(5));
	C4: TwoByOneMux port map(s(3), '1', s(4), s(6));
	C5: TwoByOneMux port map(s(6), '1', s(5), carry);
	
end Struct;



