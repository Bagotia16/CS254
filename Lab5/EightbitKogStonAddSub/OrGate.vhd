library ieee;
use ieee.std_logic_1164.all;

entity OrGate is
	port( a,b : in std_logic;
	c : out std_logic);
end entity;

architecture struct of OrGate is

component TwoByOneMux is
	port ( A : in std_logic;
	B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

begin
M1: TwoByOneMux port map(b,'1',a,c);

end struct;
