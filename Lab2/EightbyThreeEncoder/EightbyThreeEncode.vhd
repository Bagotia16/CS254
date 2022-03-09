library ieee;
use ieee.std_logic_1164.all;

entity EightbyThreeEncode is
	port ( i : in std_logic_vector(7 downto 0);
	en: in std_logic;
	z : out std_logic_vector(2 downto 0));
end entity;

architecture Struct of EightbyThreeEncode is

	component fourORGate is
		port(A,B,C,D: in std_logic;
				E: out std_logic);
	end component;
	
	component ANDGate is
		port(A,B: in std_logic;
				C: out std_logic);
	end component;
	
	signal F,G,H: std_logic;
	
	begin
		O1: fourORGate port map(i(1),i(3),i(5),i(7),F);
		O2: fourORGate port map(i(2),i(3),i(6),i(7),G);
		O3: fourORGate port map(i(4),i(5),i(6),i(7),H);
		A1: ANDGate port map(F,en,z(0));
		A2: ANDGate port map(G,en,z(1));
		A3: ANDGate port map(H,en,z(2));
		
	end Struct;
		
		