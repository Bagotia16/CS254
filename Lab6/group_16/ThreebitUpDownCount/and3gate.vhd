library ieee;
use ieee.std_logic_1164.all;

entity and3gate is
Port(A,B,C: in std_logic;
	D: out std_logic);
end entity;

architecture struct of and3gate is

component andgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

signal x: std_logic;

begin
A1: andgate port map(A,B,x);
A2: andgate port map(x,C,D);

end struct;
