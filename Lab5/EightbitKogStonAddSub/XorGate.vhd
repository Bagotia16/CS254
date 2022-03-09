library ieee;
use ieee.std_logic_1164.all;

entity XorGate is
	port( a,b : in std_logic;
	c : out std_logic);
end entity;

architecture struct of XorGate is

component TwoByOneMux is
	port ( A : in std_logic;
	B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal D: std_logic;

begin
	M1: TwoByOneMux port map('1','0',b,D);
	M2: TwoByOneMux port map(b,D,a,c);
	
end struct;
