library ieee;
use ieee.std_logic_1164.all;

entity or3gate is
Port(A,B,C: in std_logic;
	D: out std_logic);
end entity;

architecture struct of or3gate is

component orgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

signal x: std_logic;

begin
O1: orgate port map(A,B,x);
O2: orgate port map(x,C,D);

end struct;