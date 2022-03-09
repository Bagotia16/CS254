library ieee;
use ieee.std_logic_1164.all;

entity threeANDGate is
	port(
		A,B,C: in std_logic;
		D: out std_logic);
	end entity;
	
architecture Struct of threeANDGate is
	component ANDGate is
	port(A,B: in std_logic;
			C: out std_logic);
	end component;
	
	signal F: std_logic;
	
	begin
		A1: ANDGate port map(A,B,F);
		A2: ANDGate port map(C,F,D);
	end architecture;