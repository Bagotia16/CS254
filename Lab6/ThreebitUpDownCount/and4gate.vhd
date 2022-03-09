library ieee;
use ieee.std_logic_1164.all;

entity and4gate is
Port(A,B,C,D: in std_logic;
	E: out std_logic);
end entity;

architecture struct of and4gate is

component andgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

signal x,y: std_logic;

begin
A1: andgate port map(A,B,x);
A2: andgate port map(C,D,y);
A3: andgate port map(x,y,E);

end struct;
