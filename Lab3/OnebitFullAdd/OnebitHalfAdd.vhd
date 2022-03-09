library ieee;
use ieee.std_logic_1164.all;

entity OnebitHalfAdd is
	port ( a, b : in std_logic;
	sum, carry: out std_logic);
end entity;

architecture Struct of OnebitHalfAdd is 

component TwoByOneMux is
	port ( A : in std_logic;
			B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal f1: std_logic;

begin
	M1: TwoByOneMux port map('1', '0', b, f1);
	S1: TwoByOneMux port map(b, f1, a, sum);
	C1: TwoByOneMux port map('0', b, a, carry);
	
end Struct;
