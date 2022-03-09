library ieee;
use ieee.std_logic_1164.all;

entity andgate is
Port( A,B: in std_logic;
	E: out std_logic);
end andgate;

architecture working of andgate is
begin
E<=(A and B);
end working;
