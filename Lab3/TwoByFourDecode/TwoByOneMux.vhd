library ieee;
use ieee.std_logic_1164.all;

entity TwoByOneMux is
	port ( A : in std_logic;
			B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end entity;

architecture Struct of TwoByOneMux is

component ANDGate is
	port(A,B: in std_logic;
			C: out std_logic);
	end component;

component ORGate is
	port(A,B: in std_logic;
			C: out std_logic);
	end component;
	
component NOTGate is
	port(A: in std_logic;
			B: out std_logic);
	end component;
	
	signal D,E,F: std_logic;
	
begin
	N1: NOTGate port map(sel, D);
	A1: ANDGate port map(D,A,E);
	A2: AndGate port map(sel, B, F);
	O1: ORGate port map(E, F, z);
	
end Struct;