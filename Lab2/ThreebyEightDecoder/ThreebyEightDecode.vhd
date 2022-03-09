library ieee;
use ieee.std_logic_1164.all;

entity ThreebyEightDecode is
	port ( i : in std_logic_vector(2 downto 0);
	en: in std_logic;
	z : out std_logic_vector(7 downto 0));
end entity;

architecture Struct of ThreebyEightDecode is
	component threeANDGate is
		port(A,B,C: in std_logic;
				D: out std_logic);
	end component;
	
	component NOTGate is
		port(A: in std_logic;
			  B: out std_logic);
	end component;
	
	component ANDGate is
		port(A,B: in std_logic;
			  C: out std_logic);
	end component;
	
signal n: std_logic_vector(2 downto 0);
signal d: std_logic_vector(7 downto 0);

begin
	n1: NOTGate port map(i(0),n(0));
	n2: NOTGate port map(i(1),n(1));
	n3: NOTGate port map(i(2),n(2));
	
	D0: threeANDGate port map(n(2),n(1),n(0),d(0));
	D1: threeANDGate port map(i(0),n(1),n(0),d(1));
	D2: threeANDGate port map(i(1),n(0),n(2),d(2));
	D3: threeANDGate port map(i(0),i(1),n(2),d(3));
	D4: threeANDGate port map(i(2),n(1),n(0),d(4));
	D5: threeANDGate port map(i(2),n(1),i(0),d(5));
	D6: threeANDGate port map(i(2),i(1),n(0),d(6));
	D7: threeANDGate port map(i(2),i(1),i(0),d(7));
	
	E0: ANDGate port map(d(0),en,z(0));
	E1: ANDGate port map(d(1),en,z(1));
	E2: ANDGate port map(d(2),en,z(2));
	E3: ANDGate port map(d(3),en,z(3));
	E4: ANDGate port map(d(4),en,z(4));
	E5: ANDGate port map(d(5),en,z(5));
	E6: ANDGate port map(d(6),en,z(6));
	E7: ANDGate port map(d(7),en,z(7));
	
end Struct;