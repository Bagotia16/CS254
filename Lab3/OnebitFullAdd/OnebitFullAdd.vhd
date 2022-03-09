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

component OnebitHalfAdd is
	port ( a, b : in std_logic;
	sum, carry: out std_logic);
end component;

signal s1,c1,c2: std_logic;

begin
	H1: OnebitHalfAdd port map(a,b,s1,c1);
	H2: OnebitHalfAdd port map(s1,cin,sum,c2);
	
	M1: TwoByOneMux port map(c1,'1',c2, carry);

	
end Struct;



