library ieee;
use ieee.std_logic_1164.all;

entity fourORGate is
	port(
		A,B,C,D: in std_logic;
		E: out std_logic);
	end entity;
	
	
architecture Struct of fourORGate is
	component ORGate is
	port(A,B: in std_logic;
			C: out std_logic);
	end component;
	
	signal F,G: std_logic;
	
	begin
		O1: ORGate port map(A,B,F);
		O2: ORGate port map(C,D,G);
		O3: ORGate port map(F,G,E);
	end architecture;